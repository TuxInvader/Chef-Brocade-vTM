# === library: Vtm_license_keys

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_license_keys < Resource::VtmRest

    identity_attr :name
    provides :vtm_license_keys
    self.resource_name = :vtm_license_keys
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "license_keys"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/license_keys/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_license_keys < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_license_keys.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_license_keys,
        provider: Chef::Provider::Vtm_license_keys,
)

