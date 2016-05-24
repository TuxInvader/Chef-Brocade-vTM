# === library: Vtm_ssl_server_keys

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_ssl_server_keys < Resource::VtmRest

    identity_attr :name
    provides :vtm_ssl_server_keys
    self.resource_name = :vtm_ssl_server_keys
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "ssl_server_keys"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/ssl/server_keys/"

    attribute :basic__public, kind_of: String, required: true
    attribute :basic__private, kind_of: String, required: true

    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__request, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_ssl_server_keys < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_ssl_server_keys.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__request] = new_resource.basic__request

    end
  end
end

Chef::Platform.set(
        resource: :vtm_ssl_server_keys,
        provider: Chef::Provider::Vtm_ssl_server_keys,
)

