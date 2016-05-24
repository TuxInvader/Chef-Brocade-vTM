# === library: Vtm_bgpneighbors

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_bgpneighbors < Resource::VtmRest

    identity_attr :name
    provides :vtm_bgpneighbors
    self.resource_name = :vtm_bgpneighbors
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "bgpneighbors"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/bgpneighbors/"


    attribute :basic__address, kind_of: String, default: ''
    attribute :basic__advertisement_interval, kind_of: Fixnum, default: 5
    attribute :basic__as_number, kind_of: Fixnum, default: 65534
    attribute :basic__authentication_password, kind_of: String, default: ''
    attribute :basic__holdtime, kind_of: Fixnum, default: 90
    attribute :basic__keepalive, kind_of: Fixnum, default: 30
    attribute :basic__machines, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_bgpneighbors < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_bgpneighbors.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__address] = new_resource.basic__address
      @configHash[:basic__advertisement_interval] = new_resource.basic__advertisement_interval
      @configHash[:basic__as_number] = new_resource.basic__as_number
      @configHash[:basic__authentication_password] = new_resource.basic__authentication_password
      @configHash[:basic__holdtime] = new_resource.basic__holdtime
      @configHash[:basic__keepalive] = new_resource.basic__keepalive
      @configHash[:basic__machines] = new_resource.basic__machines

    end
  end
end

Chef::Platform.set(
        resource: :vtm_bgpneighbors,
        provider: Chef::Provider::Vtm_bgpneighbors,
)

