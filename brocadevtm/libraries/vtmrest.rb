require 'chef/provider/lwrp_base'
require 'erubis'

require_relative 'vtmcontroller'

class Chef 
	class Resource::VtmRest < Resource::LWRPBase 

		identity_attr :name
		provides :vtmrest
	
		self.resource_name = :vtmrest

		actions :create, :delete
		default_action :create

		attribute :name, kind_of: String, name_attribute: true
		attribute :internal, kind_of: String, default: 'vtm_rest'

	end
end

class Chef
	class Provider::VtmRest < Provider::LWRPBase

		def whyrun_supported?
  			true
		end

		def initialize(new_resource, run_context)
			super(new_resource, run_context)
			endpoint = "https://#{node['brocadevtm']['rest_host']}:#{node['brocadevtm']['rest_port']}#{new_resource.path}"
			@vtmrc = BrocadeREST::VTMController.new(node['brocadevtm']['rest_user'], \
							node['brocadevtm']['rest_pass'], endpoint, nil,\
			 				node['brocadevtm']['debug'] )

            if new_resource.to_hash.has_key?(:content)
                @content = new_resource.content
                @type = "application/octet-stream"
            else
                @type = "application/json"
            end

		end

		def action_create 
			if resource_matches?
				Chef::Log.info "#{@current_resource} already exists on vTM - nothing to do."
			else
				converge_by("Create vTM Resource #{@new_resource}:") do
					$response = @vtmrc.objectCreate(@current_resource.name, @content, \
						@type, @current_resource.internal)
					if $response.nil?
						Chef::Log.warn "#{@current_resource} creation failed! Nil response"
						raise "Failed to create resource"
					elsif $response.code.start_with?("20")
						Chef::Log.info "#{@current_resource} created"
						new_resource.updated_by_last_action(true)
					else
						Chef::Log.warn "#{@current_resource} creation failed! vTM Response: #{$response.code}"
					end
				end
			end
		end
	
		def action_delete 
			converge_by("Delete vTM Resource #{@current_resource}") do
				Chef::Log.info "Deletion not supported yet"
			end
		end
		
		def process_template
			dirPath = ::File.dirname(__FILE__)
			input = ::File.read( "#{dirPath}/../templates/default/#{@new_resource.internal}.erb" )
			eruby = Erubis::Eruby.new(input)
			@configHash.merge!(@new_resource.to_hash)
			@content = eruby.result( @configHash )
		end

        def process_content
            dirPath = ::File.dirname(__FILE__)
            localFile = "#{dirPath}/../files/#{@content}"
            if ::File.exists?(localFile)
                @content = IO.read(localFile)
            end
        end

		def resource_matches?
			if @content.nil?
				process_template
            else
				process_content
			end
			$response = @vtmrc.objectCompare(@current_resource.name, @content, @type, @current_resource.internal)
			if $response.nil?
				Chef::Log.warn "#{ @current_resource } check failed. Unkown Error"
				raise "Failed to determine current state"
			elsif $response.is_a?(TrueClass) or $response.is_a?(FalseClass)
				return $response
			elsif $response.code == 404
				Chef::Log.info "#{ @current_resource } does not exist on vTM"
				return false
			end
			return false
		end
		
	end
end

Chef::Platform.set(
	resource: :vtmrest,
	provider: Chef::Provider::VtmRest,
)

