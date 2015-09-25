# === Define: Vtm_aptimizer_scopes

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_aptimizer_scopes < Resource::VtmRest

    identity_attr :name
    provides :vtm_aptimizer_scopes
    self.resource_name = :vtm_aptimizer_scopes
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "aptimizer_scopes"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/aptimizer/scopes/"


    attribute :basic__canonical_hostname, kind_of: String, default: ''
    attribute :basic__hostnames, kind_of: [Array, String], default: []
    attribute :basic__root, kind_of: String, default: '/'

  end
end

class Chef
  class Provider::Vtm_aptimizer_scopes < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_aptimizer_scopes.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__canonical_hostname] = new_resource.basic__canonical_hostname
      @configHash[:basic__hostnames] = new_resource.basic__hostnames
      @configHash[:basic__root] = new_resource.basic__root

    end
  end
end

Chef::Platform.set(
        resource: :vtm_aptimizer_scopes,
        provider: Chef::Provider::Vtm_aptimizer_scopes,
)

