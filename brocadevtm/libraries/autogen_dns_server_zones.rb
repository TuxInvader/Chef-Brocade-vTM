# === Define: Vtm_dns_server_zones

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_dns_server_zones < Resource::VtmRest

    identity_attr :name
    provides :vtm_dns_server_zones
    self.resource_name = :vtm_dns_server_zones
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "dns_server_zones"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/dns_server/zones/"

    attribute :basic__origin, kind_of: String, required: true
    attribute :basic__zonefile, kind_of: String, required: true


  end
end

class Chef
  class Provider::Vtm_dns_server_zones < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_dns_server_zones.new(new_resource.name)
      super

      @configHash = {}

    end
  end
end

Chef::Platform.set(
        resource: :vtm_dns_server_zones,
        provider: Chef::Provider::Vtm_dns_server_zones,
)

