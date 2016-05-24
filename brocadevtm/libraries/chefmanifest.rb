#!/usr/bin/ruby

require 'json'
require 'uri'
require 'fileutils'
require 'erubis'

require_relative 'manifest'

module BrocadeREST

	class ChefManifest < Manifest

		def initialize(type, uri, restVersion, object, root="properties", traverseArray=false)
			super(type,uri,restVersion,object,root,traverseArray)
		end

		# Generate the manifest. 
		def genManifest(outputDir,isClass=false)

			# If we have documentation available in the skel/docs folder then read it.
			# Else if we have a parent type, refer to that manifest.
			docfile = "__FILE__/../skel/docs/#{@type_}.doc"
			if ( File.exist?(docfile) )
				documentation = File.read(docfile)
				if isClass
					documentation.sub!("<CLASS-OR-TYPE-DECLARATION>","class {'brocadevtm::#{@type_}':")
				else 
					documentation.sub!("<CLASS-OR-TYPE-DECLARATION>","vtm_#{@type_} 'example' do")
				end
			elsif (@template != nil)
				parent = @template.chomp(".erb")
				documentation = "#\n# This class is a direct implementation of brocadvtm, Vtm_#{parent}\n"
				documentation += "#\n# Please refer to the documentation in that module for more information\n"
				documentation += "#\n"
			else
				documentation = ""
			end

			# build the parameters hash from the raw JSON
			decodeJSON()

            # In Chef we create recipes for classes and libraries for everything else
            # We must create libraries for classes without parents.
            if isClass and parent.nil? and (!@isBinary)
                isClass = false
                outputDir = outputDir[0..-8] + "libraries"
            end

			# Built in objects should be classes, while types should get defines.
			# There is only one Ping monitor, but there are lots of monitors
			code = ""
			if isClass
				desc = "# === Recipe: Vtm_#{@type_}\n"
			else
				desc = "# === library: Vtm_#{@type_}\n"
			end

			# set content for binaries.
			if @isBinary 
				if isClass 
                    @params["content"] = "#{@type_}.data" 
				else
                    @params["content"] = "" 
				end
            end

            if isClass
                
                if parent.nil?
                    parent, slash, name = @type.rpartition('/')
                    parent = parent.gsub(/[\/\.-]|%20/, "_").downcase                    
                else
                    skip = parent.length + 1
                    name = @type[skip..-1]
                end
                code += "vtm_#{parent} '#{name}' do\n"
                code += "\taction = :create\n"

                @params.each do |key,value|
                     value = inspectValue(value)
                     if value == "undef"
                        next
                     end
                     code += "\t#{key} #{value}\n"
                 end

                code += "end\n" 
            
			else

				dirPath = File.dirname(__FILE__)
				input = File.read( "#{dirPath}/../data/chef-resource.erb")
				eruby = Erubis::Eruby.new(input)
				code += eruby.result(binding())
				
			end

			# Finally write the manifest to disk
			filename = "#{outputDir}/autogen_#{@type_}.rb"
			manifest = File.open(filename, "w")
			manifest.puts desc
			manifest.puts documentation
			manifest.puts code
			manifest.close

		end


		# Write a node config to the given outfile.
		# By default we write all configuration to the outfile, however...
		# If allParams is false, then ignore params which are using defaults
		# If builtin is false, then don't create config for built-in objects (unless they're in use)
		def genNodeConfig(outfile, allParams, builtins, preReq, manifestDir, binDir=nil)

			isBuiltin = false
			myfile = "#{manifestDir}/#{@type_}.pp"

			if File.exist?(myfile)
				# I have my own manifest, I'm a builtin class
				isBuiltin = true
				parentFile = File.basename(myfile).chomp(".pp")
			else
				# Locate my type definition file
				parentFile = findParent(myfile, extension=".pp").chomp(".pp")
			end

			# Generate the classHash which will have all the defaults for my type
			if parentFile != nil
				classHash = parseManifest(manifestDir, parentFile)
				name = @uri.sub(/.*?\/config\/active\/.*\/(.*)/,'\1')
			else
				classHash = {}
			end

			# If I'm binary and a builtin class, then read in my default data
			if @isBinary
				if isBuiltin
					myDataFile = classHash["content"].sub("brocadevtm","#{manifestDir}../files")[7..-4]
					if File.exist?(myDataFile) 
						myData = File.read(myDataFile) 
					else
						myData = ""
					end
				else
					myData = ""
				end

			# If I'm a JSON object, then decode the data
			else
				decodeJSON()

				# Process the preReqs to determine which objects we have dependencies on. This will 
				# populate the requires meta-data, and inform puppet of our relationships to ensure
				# objects are created in a sensible order. 
				if preReq.has_key?(parentFile)
					checkRequires(parentFile,preReq,manifestDir,builtins,outfile)
				end

				# If we're generating a sparse config or excluding default built-in classes
				# then check to see which params are using defaults and drop them.
				if (!allParams) or (isBuiltin and !builtins) 
					@params.each do |key,value|
					value = inspectValue(value)
						if classHash.has_key?(key)
							if classHash[key] == value
								@params.delete(key)
							else
								puts("Including/Declaring #{@type}, uses custom setting for: #{key}")
							end
						end
					end
				end
			end

			# If we're a unmodified built-in, and built-ins are excluded, then we're done
			if (!builtins) and isBuiltin 
				if (!@isBinary) and @params.empty?
					puts("Ignoring BuiltIn JSON Object: #{@type_}")
					return
				elsif @isBinary and myData == @data
					puts("Ignoring BuiltIn Binary Object: #{@type_}")
					return
				end
			end

			# Append my configuration to the output file
			nodefile = File.open(outfile,"a")
			if isBuiltin
				if @isBinary

					if (myData != @data) or allParams
						dataOut = writeBinFile(outfile,binDir)
						nodefile.puts("\nclass { 'brocadevtm::#{@type_}':\n")
						nodefile.puts("  ensure => present,\n")
						nodefile.puts("  content => file('#{dataOut}'),\n")
						nodefile.puts("}\n\n")
					else
						nodefile.puts("include brocadevtm::#{@type_}\n")
					end

				else

					if @params.empty?
						nodefile.puts("include brocadevtm::#{@type_}\n")
					else
						nodefile.puts("\nclass { 'brocadevtm::#{@type_}':\n")
						@params.each do |key,value|
							value = inspectValue(value)
							sp = " " * ( @maxKeyLength - key.length )
							nodefile.puts("  #{key}#{sp} => #{value},\n")
						end
						nodefile.puts("}\n\n")
					end

				end
			else

				nodefile.puts("\nbrocadevtm::#{parentFile} { '#{name}':\n")
				if @isBinary
						dataOut = writeBinFile(outfile,binDir)
						nodefile.puts("  ensure => present,\n")
						nodefile.puts("  content => file('#{dataOut}'),\n")
				else

					@maxKeyLength >= 6 ? sp = " " * ( @maxKeyLength - 6 ) : sp = " "
					nodefile.puts("  ensure#{sp} => present,\n")
					if ! @params.empty?
						@params.each do |key,value|
							value = inspectValue(value)
							sp = " " * ( @maxKeyLength - key.length )
							nodefile.puts("  #{key}#{sp} => #{value},\n")
						end
					end
				end
				nodefile.puts("}\n\n")

			end
			nodefile.close()

		end

		# This function generates the requires meta-data for puppet. We check the prereqs provided
		# and create a relationship for each object we use. If builtins are set to be excluded, but
		# we rely on one (eg monitors_ping), then include it here.
		def checkRequires(parentFile,preReq,manifestDir,builtins,outfile)
			requires = "["
			preReq[parentFile].each do |req|
				reqObject = req.shift
				reqVar = req.shift
				reqType = req.shift
				if (@params.has_key?(reqVar))
					if (@params[reqVar].is_a? Array)
						@params[reqVar].each do |item|
							if item.is_a?(Hash)
								puts(" --!!-- TODO : we do not yet write 'require's for Aptimizer or SNI mappings !!--!!")
							else
								ro_ = reqObject.gsub(/[\/\.\s-]|%20/, "_")
								item_ = item.gsub(/[\/\.\s-]|%20/, "_").downcase
								if File.exist?("#{manifestDir}/#{ro_.downcase}_#{item_}.pp")
									# This is a builtin class
									if (!builtins)
										puts("Relationship found for Built-in object: Including: brocadevtm::#{ro_.downcase}_#{item_}")
										# builtins are disabled, so check and include if needed
										lines = IO.readlines(outfile)
										if ( lines.grep(/brocadevtm::#{ro_.downcase}_#{item_}/).empty? )
											nodefile = File.open(outfile,"a")
											nodefile.puts("\ninclude brocadevtm::#{ro_.downcase}_#{item_}\n")
											nodefile.close()
										end  
									end
									requires += " Class[Brocadevtm::#{ro_}_#{item_}], "
								else
									escaped = item.gsub(' ', '%20')
									requires += " Brocadevtm::#{reqObject}['#{escaped}'], "
								end
							end
						end
					elsif (@params[reqVar].is_a? String)
						if @params[reqVar] == ''
							next
						end
						if req.empty? or ( (!req.empty?) and (!req.include?(@params[reqVar])) )
							escaped = @params[reqVar].gsub(' ', '%20')
							requires += " Brocadevtm::#{reqObject}['#{escaped}'], "
						end
					end
				end
				if requires != '['
					@params["require"] = requires + "]"
				end
			end
		end


		# Generate a classHash of default values from a given manifest.
		# This classHash can then be used in direct comparisson with @params
		def parseManifest(manifestDir,parentFile)
			classHash = {}
			File.open("#{manifestDir}/#{parentFile}.pp", "r").each_line do |line|
				line.scan(/\s+\$([^\s]+)\s+=\s+['"]{0,1}(.*?)['"]{0,1},\n$/) do |key,value|
					if value == "undef"
						classHash[key] = 'undef'
					elsif value.match(/^[0-9]+$/)
						classHash[key] = Integer(value)
					elsif value == "false"
						classHash[key] = false
					elsif value == "true"
						classHash[key] = true
					elsif value == "[]"
						classHash[key] = "'[]'"
					else
						classHash[key] = "'" + value + "'"
					end
				end
			end
			return classHash
		end

		# Convert values from the format used internally by ruby into the correct format
		# for writing to puppet manifests.
		def inspectValue(value)
			if value == ""
				value = "undef"
			elsif value.is_a?(Array)
				value = "'" + JSON.generate(value) + "'"
			elsif value.is_a?(String)
				if value.start_with?('[ Brocadevtm::')
					value = value.inspect[1...-1] 
				elsif value.start_with?('[ Class[')
					value = value.inspect[1...-1] 
				else
					value = "'" + value.inspect[1...-1] + "'"
				end
			end
			return value
		end

		# Check to see if this filename has a parent object. 
		# If the file type is erb, then compare the file with it's parent.
		# If the file type is pp, then check for Define, ignore Class.
		def findParent(filename, extension=".erb")
			parentFile = nil
			parent = nil
			filetree = filename.chomp(extension).split("_")
			filetree.each do |test|
				if parent == nil
					parent = test
				else
					parent += "_" + test
				end
				test = parent+extension
				if ( test == filename )
					break
				elsif ( File.exist?(test) )
					if extension == ".erb"
						if FileUtils.compare_file(test,filename)
							parentFile=test
						end
					elsif extension == ".pp"
						if IO.read(test,7) == "# === D"
							parentFile=test
						end
					elsif extension == ".rb"
						if IO.read(test,7) == "# === L"
							parentFile=test
						end
					end
				end
			end
			if parentFile != nil
				return File.basename parentFile
			end
			return nil
		end

	end

end
