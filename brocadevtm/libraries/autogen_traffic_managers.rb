# === library: Vtm_traffic_managers

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_traffic_managers < Resource::VtmRest

    identity_attr :name
    provides :vtm_traffic_managers
    self.resource_name = :vtm_traffic_managers
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "traffic_managers"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/traffic_managers/"


    attribute :basic__adminMasterXMLIP, kind_of: String, default: '0.0.0.0'
    attribute :basic__adminSlaveXMLIP, kind_of: String, default: '0.0.0.0'
    attribute :basic__appliance_sysctl, kind_of: [Array, String], default: []
    attribute :basic__authenticationServerIP, kind_of: String, default: '0.0.0.0'
    attribute :basic__cloud_platform, kind_of: String, default: ''
    attribute :basic__location, kind_of: String, default: ''
    attribute :basic__nameip, kind_of: String, default: ''
    attribute :basic__num_aptimizer_threads, kind_of: Fixnum, default: 0
    attribute :basic__num_children, kind_of: Fixnum, default: 0
    attribute :basic__numberOfCPUs, kind_of: Fixnum, default: 0
    attribute :basic__restServerPort, kind_of: Fixnum, default: 0
    attribute :basic__trafficip, kind_of: [Array, String], default: []
    attribute :basic__updaterIP, kind_of: String, default: '0.0.0.0'
    attribute :appliance__gateway_ipv4, kind_of: String, default: ''
    attribute :appliance__gateway_ipv6, kind_of: String, default: ''
    attribute :appliance__hostname, kind_of: String, default: ''
    attribute :appliance__hosts, kind_of: [Array, String], default: []
    attribute :appliance__if, kind_of: [Array, String], default: []
    attribute :appliance__ip, kind_of: [Array, String], default: []
    attribute :appliance__ipv4_forwarding, kind_of: [TrueClass, FalseClass], default: false
    attribute :appliance__licence_agreed, kind_of: [TrueClass, FalseClass], default: false
    attribute :appliance__manageazureroutes, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__manageec2conf, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__manageiptrans, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__managereturnpath, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__managevpcconf, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__name_servers, kind_of: [Array, String], default: []
    attribute :appliance__ntpservers, kind_of: [Array, String], default: ["0.vyatta.pool.ntp.org", "1.vyatta.pool.ntp.org", "2.vyatta.pool.ntp.org", "3.vyatta.pool.ntp.org"]
    attribute :appliance__routes, kind_of: [Array, String], default: []
    attribute :appliance__search_domains, kind_of: [Array, String], default: []
    attribute :appliance__shim_client_id, kind_of: String, default: ''
    attribute :appliance__shim_client_key, kind_of: String, default: ''
    attribute :appliance__shim_enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :appliance__shim_ips, kind_of: String, default: ''
    attribute :appliance__shim_load_balance, kind_of: String, default: 'round_robin'
    attribute :appliance__shim_log_level, kind_of: String, default: 'notice'
    attribute :appliance__shim_mode, kind_of: String, default: 'portal'
    attribute :appliance__shim_portal_url, kind_of: String, default: ''
    attribute :appliance__shim_proxy_host, kind_of: String, default: ''
    attribute :appliance__shim_proxy_port, kind_of: String, default: ''
    attribute :appliance__ssh_enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__ssh_port, kind_of: Fixnum, default: 22
    attribute :appliance__timezone, kind_of: String, default: 'US/Pacific'
    attribute :appliance__vlans, kind_of: [Array, String], default: []
    attribute :cluster_comms__allow_update, kind_of: [TrueClass, FalseClass], default: true
    attribute :cluster_comms__bind_ip, kind_of: String, default: '*'
    attribute :cluster_comms__external_ip, kind_of: String, default: ''
    attribute :cluster_comms__port, kind_of: Fixnum, default: 9080
    attribute :ec2__trafficips_public_enis, kind_of: [Array, String], default: []
    attribute :fault_tolerance__bgp_router_id, kind_of: String, default: ''
    attribute :fault_tolerance__ospfv2_ip, kind_of: String, default: ''
    attribute :fault_tolerance__ospfv2_neighbor_addrs, kind_of: [Array, String], default: ["%gateway%"]
    attribute :iptables__config_enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :iptrans__fwmark, kind_of: Fixnum, default: 320
    attribute :iptrans__iptables_enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :iptrans__routing_table, kind_of: Fixnum, default: 320
    attribute :java__port, kind_of: Fixnum, default: 9060
    attribute :rest_api__bind_ips, kind_of: [Array, String], default: ["*"]
    attribute :rest_api__port, kind_of: Fixnum, default: 9070
    attribute :snmp__allow, kind_of: [Array, String], default: ["all"]
    attribute :snmp__auth_password, kind_of: String, default: ''
    attribute :snmp__bind_ip, kind_of: String, default: '*'
    attribute :snmp__community, kind_of: String, default: 'public'
    attribute :snmp__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :snmp__hash_algorithm, kind_of: String, default: 'md5'
    attribute :snmp__port, kind_of: String, default: 'default'
    attribute :snmp__priv_password, kind_of: String, default: ''
    attribute :snmp__security_level, kind_of: String, default: 'noauthnopriv'
    attribute :snmp__username, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_traffic_managers < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_traffic_managers.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__adminMasterXMLIP] = new_resource.basic__adminMasterXMLIP
      @configHash[:basic__adminSlaveXMLIP] = new_resource.basic__adminSlaveXMLIP
      @configHash[:basic__appliance_sysctl] = new_resource.basic__appliance_sysctl
      @configHash[:basic__authenticationServerIP] = new_resource.basic__authenticationServerIP
      @configHash[:basic__cloud_platform] = new_resource.basic__cloud_platform
      @configHash[:basic__location] = new_resource.basic__location
      @configHash[:basic__nameip] = new_resource.basic__nameip
      @configHash[:basic__num_aptimizer_threads] = new_resource.basic__num_aptimizer_threads
      @configHash[:basic__num_children] = new_resource.basic__num_children
      @configHash[:basic__numberOfCPUs] = new_resource.basic__numberOfCPUs
      @configHash[:basic__restServerPort] = new_resource.basic__restServerPort
      @configHash[:basic__trafficip] = new_resource.basic__trafficip
      @configHash[:basic__updaterIP] = new_resource.basic__updaterIP
      @configHash[:appliance__gateway_ipv4] = new_resource.appliance__gateway_ipv4
      @configHash[:appliance__gateway_ipv6] = new_resource.appliance__gateway_ipv6
      @configHash[:appliance__hostname] = new_resource.appliance__hostname
      @configHash[:appliance__hosts] = new_resource.appliance__hosts
      @configHash[:appliance__if] = new_resource.appliance__if
      @configHash[:appliance__ip] = new_resource.appliance__ip
      @configHash[:appliance__ipv4_forwarding] = new_resource.appliance__ipv4_forwarding
      @configHash[:appliance__licence_agreed] = new_resource.appliance__licence_agreed
      @configHash[:appliance__manageazureroutes] = new_resource.appliance__manageazureroutes
      @configHash[:appliance__manageec2conf] = new_resource.appliance__manageec2conf
      @configHash[:appliance__manageiptrans] = new_resource.appliance__manageiptrans
      @configHash[:appliance__managereturnpath] = new_resource.appliance__managereturnpath
      @configHash[:appliance__managevpcconf] = new_resource.appliance__managevpcconf
      @configHash[:appliance__name_servers] = new_resource.appliance__name_servers
      @configHash[:appliance__ntpservers] = new_resource.appliance__ntpservers
      @configHash[:appliance__routes] = new_resource.appliance__routes
      @configHash[:appliance__search_domains] = new_resource.appliance__search_domains
      @configHash[:appliance__shim_client_id] = new_resource.appliance__shim_client_id
      @configHash[:appliance__shim_client_key] = new_resource.appliance__shim_client_key
      @configHash[:appliance__shim_enabled] = new_resource.appliance__shim_enabled
      @configHash[:appliance__shim_ips] = new_resource.appliance__shim_ips
      @configHash[:appliance__shim_load_balance] = new_resource.appliance__shim_load_balance
      @configHash[:appliance__shim_log_level] = new_resource.appliance__shim_log_level
      @configHash[:appliance__shim_mode] = new_resource.appliance__shim_mode
      @configHash[:appliance__shim_portal_url] = new_resource.appliance__shim_portal_url
      @configHash[:appliance__shim_proxy_host] = new_resource.appliance__shim_proxy_host
      @configHash[:appliance__shim_proxy_port] = new_resource.appliance__shim_proxy_port
      @configHash[:appliance__ssh_enabled] = new_resource.appliance__ssh_enabled
      @configHash[:appliance__ssh_port] = new_resource.appliance__ssh_port
      @configHash[:appliance__timezone] = new_resource.appliance__timezone
      @configHash[:appliance__vlans] = new_resource.appliance__vlans
      @configHash[:cluster_comms__allow_update] = new_resource.cluster_comms__allow_update
      @configHash[:cluster_comms__bind_ip] = new_resource.cluster_comms__bind_ip
      @configHash[:cluster_comms__external_ip] = new_resource.cluster_comms__external_ip
      @configHash[:cluster_comms__port] = new_resource.cluster_comms__port
      @configHash[:ec2__trafficips_public_enis] = new_resource.ec2__trafficips_public_enis
      @configHash[:fault_tolerance__bgp_router_id] = new_resource.fault_tolerance__bgp_router_id
      @configHash[:fault_tolerance__ospfv2_ip] = new_resource.fault_tolerance__ospfv2_ip
      @configHash[:fault_tolerance__ospfv2_neighbor_addrs] = new_resource.fault_tolerance__ospfv2_neighbor_addrs
      @configHash[:iptables__config_enabled] = new_resource.iptables__config_enabled
      @configHash[:iptrans__fwmark] = new_resource.iptrans__fwmark
      @configHash[:iptrans__iptables_enabled] = new_resource.iptrans__iptables_enabled
      @configHash[:iptrans__routing_table] = new_resource.iptrans__routing_table
      @configHash[:java__port] = new_resource.java__port
      @configHash[:rest_api__bind_ips] = new_resource.rest_api__bind_ips
      @configHash[:rest_api__port] = new_resource.rest_api__port
      @configHash[:snmp__allow] = new_resource.snmp__allow
      @configHash[:snmp__auth_password] = new_resource.snmp__auth_password
      @configHash[:snmp__bind_ip] = new_resource.snmp__bind_ip
      @configHash[:snmp__community] = new_resource.snmp__community
      @configHash[:snmp__enabled] = new_resource.snmp__enabled
      @configHash[:snmp__hash_algorithm] = new_resource.snmp__hash_algorithm
      @configHash[:snmp__port] = new_resource.snmp__port
      @configHash[:snmp__priv_password] = new_resource.snmp__priv_password
      @configHash[:snmp__security_level] = new_resource.snmp__security_level
      @configHash[:snmp__username] = new_resource.snmp__username

    end
  end
end

Chef::Platform.set(
        resource: :vtm_traffic_managers,
        provider: Chef::Provider::Vtm_traffic_managers,
)

