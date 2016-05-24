# === library: Vtm_pools

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_pools < Resource::VtmRest

    identity_attr :name
    provides :vtm_pools
    self.resource_name = :vtm_pools
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "pools"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/pools/"


    attribute :basic__bandwidth_class, kind_of: String, default: ''
    attribute :basic__failure_pool, kind_of: String, default: ''
    attribute :basic__max_connection_attempts, kind_of: Fixnum, default: 0
    attribute :basic__max_idle_connections_pernode, kind_of: Fixnum, default: 50
    attribute :basic__max_timed_out_connection_attempts, kind_of: Fixnum, default: 2
    attribute :basic__monitors, kind_of: [Array, String], default: []
    attribute :basic__node_close_with_rst, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__node_connection_attempts, kind_of: Fixnum, default: 3
    attribute :basic__node_delete_behavior, kind_of: String, default: 'immediate'
    attribute :basic__node_drain_to_delete_timeout, kind_of: Fixnum, default: 0
    attribute :basic__nodes_table, kind_of: [Array, String], default: []
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__passive_monitoring, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__persistence_class, kind_of: String, default: ''
    attribute :basic__transparent, kind_of: [TrueClass, FalseClass], default: false
    attribute :auto_scaling__addnode_delaytime, kind_of: Fixnum, default: 0
    attribute :auto_scaling__cloud_credentials, kind_of: String, default: ''
    attribute :auto_scaling__cluster, kind_of: String, default: ''
    attribute :auto_scaling__data_center, kind_of: String, default: ''
    attribute :auto_scaling__data_store, kind_of: String, default: ''
    attribute :auto_scaling__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :auto_scaling__external, kind_of: [TrueClass, FalseClass], default: true
    attribute :auto_scaling__hysteresis, kind_of: Fixnum, default: 20
    attribute :auto_scaling__imageid, kind_of: String, default: ''
    attribute :auto_scaling__ips_to_use, kind_of: String, default: 'publicips'
    attribute :auto_scaling__last_node_idle_time, kind_of: Fixnum, default: 3600
    attribute :auto_scaling__max_nodes, kind_of: Fixnum, default: 4
    attribute :auto_scaling__min_nodes, kind_of: Fixnum, default: 1
    attribute :auto_scaling__name, kind_of: String, default: ''
    attribute :auto_scaling__port, kind_of: Fixnum, default: 80
    attribute :auto_scaling__refractory, kind_of: Fixnum, default: 180
    attribute :auto_scaling__response_time, kind_of: Fixnum, default: 1000
    attribute :auto_scaling__scale_down_level, kind_of: Fixnum, default: 95
    attribute :auto_scaling__scale_up_level, kind_of: Fixnum, default: 40
    attribute :auto_scaling__securitygroupids, kind_of: [Array, String], default: []
    attribute :auto_scaling__size_id, kind_of: String, default: ''
    attribute :auto_scaling__subnetids, kind_of: [Array, String], default: []
    attribute :connection__max_connect_time, kind_of: Fixnum, default: 4
    attribute :connection__max_connections_per_node, kind_of: Fixnum, default: 0
    attribute :connection__max_queue_size, kind_of: Fixnum, default: 0
    attribute :connection__max_reply_time, kind_of: Fixnum, default: 30
    attribute :connection__queue_timeout, kind_of: Fixnum, default: 10
    attribute :dns_autoscale__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :dns_autoscale__hostnames, kind_of: [Array, String], default: []
    attribute :dns_autoscale__port, kind_of: Fixnum, default: 80
    attribute :ftp__support_rfc_2428, kind_of: [TrueClass, FalseClass], default: false
    attribute :http__keepalive, kind_of: [TrueClass, FalseClass], default: true
    attribute :http__keepalive_non_idempotent, kind_of: [TrueClass, FalseClass], default: false
    attribute :kerberos_protocol_transition__principal, kind_of: String, default: ''
    attribute :kerberos_protocol_transition__target, kind_of: String, default: ''
    attribute :load_balancing__algorithm, kind_of: String, default: 'round_robin'
    attribute :load_balancing__priority_enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :load_balancing__priority_nodes, kind_of: Fixnum, default: 1
    attribute :node__close_on_death, kind_of: [TrueClass, FalseClass], default: false
    attribute :node__retry_fail_time, kind_of: Fixnum, default: 60
    attribute :smtp__send_starttls, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__client_auth, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__common_name_match, kind_of: [Array, String], default: []
    attribute :ssl__elliptic_curves, kind_of: [Array, String], default: []
    attribute :ssl__enable, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__enhance, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__send_close_alerts, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__server_name, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__signature_algorithms, kind_of: String, default: ''
    attribute :ssl__ssl_ciphers, kind_of: String, default: ''
    attribute :ssl__ssl_support_ssl2, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_ssl3, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1_1, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1_2, kind_of: String, default: 'use_default'
    attribute :ssl__strict_verify, kind_of: [TrueClass, FalseClass], default: false
    attribute :tcp__nagle, kind_of: [TrueClass, FalseClass], default: true
    attribute :udp__accept_from, kind_of: String, default: 'dest_only'
    attribute :udp__accept_from_mask, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_pools < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_pools.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__bandwidth_class] = new_resource.basic__bandwidth_class
      @configHash[:basic__failure_pool] = new_resource.basic__failure_pool
      @configHash[:basic__max_connection_attempts] = new_resource.basic__max_connection_attempts
      @configHash[:basic__max_idle_connections_pernode] = new_resource.basic__max_idle_connections_pernode
      @configHash[:basic__max_timed_out_connection_attempts] = new_resource.basic__max_timed_out_connection_attempts
      @configHash[:basic__monitors] = new_resource.basic__monitors
      @configHash[:basic__node_close_with_rst] = new_resource.basic__node_close_with_rst
      @configHash[:basic__node_connection_attempts] = new_resource.basic__node_connection_attempts
      @configHash[:basic__node_delete_behavior] = new_resource.basic__node_delete_behavior
      @configHash[:basic__node_drain_to_delete_timeout] = new_resource.basic__node_drain_to_delete_timeout
      @configHash[:basic__nodes_table] = new_resource.basic__nodes_table
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__passive_monitoring] = new_resource.basic__passive_monitoring
      @configHash[:basic__persistence_class] = new_resource.basic__persistence_class
      @configHash[:basic__transparent] = new_resource.basic__transparent
      @configHash[:auto_scaling__addnode_delaytime] = new_resource.auto_scaling__addnode_delaytime
      @configHash[:auto_scaling__cloud_credentials] = new_resource.auto_scaling__cloud_credentials
      @configHash[:auto_scaling__cluster] = new_resource.auto_scaling__cluster
      @configHash[:auto_scaling__data_center] = new_resource.auto_scaling__data_center
      @configHash[:auto_scaling__data_store] = new_resource.auto_scaling__data_store
      @configHash[:auto_scaling__enabled] = new_resource.auto_scaling__enabled
      @configHash[:auto_scaling__external] = new_resource.auto_scaling__external
      @configHash[:auto_scaling__hysteresis] = new_resource.auto_scaling__hysteresis
      @configHash[:auto_scaling__imageid] = new_resource.auto_scaling__imageid
      @configHash[:auto_scaling__ips_to_use] = new_resource.auto_scaling__ips_to_use
      @configHash[:auto_scaling__last_node_idle_time] = new_resource.auto_scaling__last_node_idle_time
      @configHash[:auto_scaling__max_nodes] = new_resource.auto_scaling__max_nodes
      @configHash[:auto_scaling__min_nodes] = new_resource.auto_scaling__min_nodes
      @configHash[:auto_scaling__name] = new_resource.auto_scaling__name
      @configHash[:auto_scaling__port] = new_resource.auto_scaling__port
      @configHash[:auto_scaling__refractory] = new_resource.auto_scaling__refractory
      @configHash[:auto_scaling__response_time] = new_resource.auto_scaling__response_time
      @configHash[:auto_scaling__scale_down_level] = new_resource.auto_scaling__scale_down_level
      @configHash[:auto_scaling__scale_up_level] = new_resource.auto_scaling__scale_up_level
      @configHash[:auto_scaling__securitygroupids] = new_resource.auto_scaling__securitygroupids
      @configHash[:auto_scaling__size_id] = new_resource.auto_scaling__size_id
      @configHash[:auto_scaling__subnetids] = new_resource.auto_scaling__subnetids
      @configHash[:connection__max_connect_time] = new_resource.connection__max_connect_time
      @configHash[:connection__max_connections_per_node] = new_resource.connection__max_connections_per_node
      @configHash[:connection__max_queue_size] = new_resource.connection__max_queue_size
      @configHash[:connection__max_reply_time] = new_resource.connection__max_reply_time
      @configHash[:connection__queue_timeout] = new_resource.connection__queue_timeout
      @configHash[:dns_autoscale__enabled] = new_resource.dns_autoscale__enabled
      @configHash[:dns_autoscale__hostnames] = new_resource.dns_autoscale__hostnames
      @configHash[:dns_autoscale__port] = new_resource.dns_autoscale__port
      @configHash[:ftp__support_rfc_2428] = new_resource.ftp__support_rfc_2428
      @configHash[:http__keepalive] = new_resource.http__keepalive
      @configHash[:http__keepalive_non_idempotent] = new_resource.http__keepalive_non_idempotent
      @configHash[:kerberos_protocol_transition__principal] = new_resource.kerberos_protocol_transition__principal
      @configHash[:kerberos_protocol_transition__target] = new_resource.kerberos_protocol_transition__target
      @configHash[:load_balancing__algorithm] = new_resource.load_balancing__algorithm
      @configHash[:load_balancing__priority_enabled] = new_resource.load_balancing__priority_enabled
      @configHash[:load_balancing__priority_nodes] = new_resource.load_balancing__priority_nodes
      @configHash[:node__close_on_death] = new_resource.node__close_on_death
      @configHash[:node__retry_fail_time] = new_resource.node__retry_fail_time
      @configHash[:smtp__send_starttls] = new_resource.smtp__send_starttls
      @configHash[:ssl__client_auth] = new_resource.ssl__client_auth
      @configHash[:ssl__common_name_match] = new_resource.ssl__common_name_match
      @configHash[:ssl__elliptic_curves] = new_resource.ssl__elliptic_curves
      @configHash[:ssl__enable] = new_resource.ssl__enable
      @configHash[:ssl__enhance] = new_resource.ssl__enhance
      @configHash[:ssl__send_close_alerts] = new_resource.ssl__send_close_alerts
      @configHash[:ssl__server_name] = new_resource.ssl__server_name
      @configHash[:ssl__signature_algorithms] = new_resource.ssl__signature_algorithms
      @configHash[:ssl__ssl_ciphers] = new_resource.ssl__ssl_ciphers
      @configHash[:ssl__ssl_support_ssl2] = new_resource.ssl__ssl_support_ssl2
      @configHash[:ssl__ssl_support_ssl3] = new_resource.ssl__ssl_support_ssl3
      @configHash[:ssl__ssl_support_tls1] = new_resource.ssl__ssl_support_tls1
      @configHash[:ssl__ssl_support_tls1_1] = new_resource.ssl__ssl_support_tls1_1
      @configHash[:ssl__ssl_support_tls1_2] = new_resource.ssl__ssl_support_tls1_2
      @configHash[:ssl__strict_verify] = new_resource.ssl__strict_verify
      @configHash[:tcp__nagle] = new_resource.tcp__nagle
      @configHash[:udp__accept_from] = new_resource.udp__accept_from
      @configHash[:udp__accept_from_mask] = new_resource.udp__accept_from_mask

    end
  end
end

Chef::Platform.set(
        resource: :vtm_pools,
        provider: Chef::Provider::Vtm_pools,
)

