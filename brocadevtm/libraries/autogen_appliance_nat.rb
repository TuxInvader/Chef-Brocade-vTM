# === library: Vtm_appliance_nat

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_appliance_nat < Resource::VtmRest

    identity_attr :name
    provides :vtm_appliance_nat
    self.resource_name = :vtm_appliance_nat
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "appliance_nat"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/appliance/nat"


    attribute :basic__many_to_one_all_ports, kind_of: [Array, String], default: []
    attribute :basic__many_to_one_port_locked, kind_of: [Array, String], default: []
    attribute :basic__one_to_one, kind_of: [Array, String], default: []
    attribute :basic__port_mapping, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_appliance_nat < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_appliance_nat.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__many_to_one_all_ports] = new_resource.basic__many_to_one_all_ports
      @configHash[:basic__many_to_one_port_locked] = new_resource.basic__many_to_one_port_locked
      @configHash[:basic__one_to_one] = new_resource.basic__one_to_one
      @configHash[:basic__port_mapping] = new_resource.basic__port_mapping

    end
  end
end

Chef::Platform.set(
        resource: :vtm_appliance_nat,
        provider: Chef::Provider::Vtm_appliance_nat,
)

