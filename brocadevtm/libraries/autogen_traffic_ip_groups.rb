# === library: Vtm_traffic_ip_groups

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_traffic_ip_groups < Resource::VtmRest

    identity_attr :name
    provides :vtm_traffic_ip_groups
    self.resource_name = :vtm_traffic_ip_groups
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "traffic_ip_groups"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/traffic_ip_groups/"


    attribute :basic__enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__hash_source_port, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__ip_assignment_mode, kind_of: String, default: 'balanced'
    attribute :basic__ip_mapping, kind_of: [Array, String], default: []
    attribute :basic__ipaddresses, kind_of: [Array, String], default: []
    attribute :basic__keeptogether, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__location, kind_of: Fixnum, default: 0
    attribute :basic__machines, kind_of: [Array, String], default: []
    attribute :basic__mode, kind_of: String, default: 'singlehosted'
    attribute :basic__multicast, kind_of: String, default: ''
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__rhi_bgp_metric_base, kind_of: Fixnum, default: 10
    attribute :basic__rhi_bgp_passive_metric_offset, kind_of: Fixnum, default: 10
    attribute :basic__rhi_ospfv2_metric_base, kind_of: Fixnum, default: 10
    attribute :basic__rhi_ospfv2_passive_metric_offset, kind_of: Fixnum, default: 10
    attribute :basic__rhi_protocols, kind_of: String, default: 'ospf'
    attribute :basic__slaves, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_traffic_ip_groups < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_traffic_ip_groups.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__enabled] = new_resource.basic__enabled
      @configHash[:basic__hash_source_port] = new_resource.basic__hash_source_port
      @configHash[:basic__ip_assignment_mode] = new_resource.basic__ip_assignment_mode
      @configHash[:basic__ip_mapping] = new_resource.basic__ip_mapping
      @configHash[:basic__ipaddresses] = new_resource.basic__ipaddresses
      @configHash[:basic__keeptogether] = new_resource.basic__keeptogether
      @configHash[:basic__location] = new_resource.basic__location
      @configHash[:basic__machines] = new_resource.basic__machines
      @configHash[:basic__mode] = new_resource.basic__mode
      @configHash[:basic__multicast] = new_resource.basic__multicast
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__rhi_bgp_metric_base] = new_resource.basic__rhi_bgp_metric_base
      @configHash[:basic__rhi_bgp_passive_metric_offset] = new_resource.basic__rhi_bgp_passive_metric_offset
      @configHash[:basic__rhi_ospfv2_metric_base] = new_resource.basic__rhi_ospfv2_metric_base
      @configHash[:basic__rhi_ospfv2_passive_metric_offset] = new_resource.basic__rhi_ospfv2_passive_metric_offset
      @configHash[:basic__rhi_protocols] = new_resource.basic__rhi_protocols
      @configHash[:basic__slaves] = new_resource.basic__slaves

    end
  end
end

Chef::Platform.set(
        resource: :vtm_traffic_ip_groups,
        provider: Chef::Provider::Vtm_traffic_ip_groups,
)

