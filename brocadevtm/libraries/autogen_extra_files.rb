# === library: Vtm_extra_files

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_extra_files < Resource::VtmRest

    identity_attr :name
    provides :vtm_extra_files
    self.resource_name = :vtm_extra_files
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "extra_files"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/extra_files/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_extra_files < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_extra_files.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_extra_files,
        provider: Chef::Provider::Vtm_extra_files,
)

