# === library: Vtm_global_settings

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_global_settings < Resource::VtmRest

    identity_attr :name
    provides :vtm_global_settings
    self.resource_name = :vtm_global_settings
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "global_settings"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/global_settings"


    attribute :basic__accepting_delay, kind_of: Fixnum, default: 50
    attribute :basic__afm_enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__chunk_size, kind_of: Fixnum, default: 16384
    attribute :basic__client_first_opt, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__license_servers, kind_of: [Array, String], default: []
    attribute :basic__max_fds, kind_of: Fixnum, default: 1048576
    attribute :basic__monitor_memory_size, kind_of: Fixnum, default: 4096
    attribute :basic__rate_class_limit, kind_of: Fixnum, default: 25000
    attribute :basic__shared_pool_size, kind_of: String, default: '10MB'
    attribute :basic__slm_class_limit, kind_of: Fixnum, default: 1024
    attribute :basic__so_rbuff_size, kind_of: Fixnum, default: 0
    attribute :basic__so_wbuff_size, kind_of: Fixnum, default: 0
    attribute :basic__socket_optimizations, kind_of: String, default: 'auto'
    attribute :basic__tip_class_limit, kind_of: Fixnum, default: 10000
    attribute :admin__honor_fallback_scsv, kind_of: [TrueClass, FalseClass], default: true
    attribute :admin__ssl3_allow_rehandshake, kind_of: String, default: 'rfc5746'
    attribute :admin__ssl3_ciphers, kind_of: String, default: 'SSL_RSA_WITH_AES_128_GCM_SHA256,SSL_RSA_WITH_AES_128_CBC_SHA256,SSL_RSA_WITH_AES_128_CBC_SHA,SSL_RSA_WITH_AES_256_GCM_SHA384,SSL_RSA_WITH_AES_256_CBC_SHA256,SSL_RSA_WITH_AES_256_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA,SSL_DHE_DSS_WITH_AES_128_CBC_SHA,SSL_DHE_DSS_WITH_AES_256_CBC_SHA,SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA'
    attribute :admin__ssl3_diffie_hellman_key_length, kind_of: String, default: 'dh_2048'
    attribute :admin__ssl3_min_rehandshake_interval, kind_of: Fixnum, default: 1000
    attribute :admin__ssl_elliptic_curves, kind_of: [Array, String], default: []
    attribute :admin__ssl_insert_extra_fragment, kind_of: [TrueClass, FalseClass], default: false
    attribute :admin__ssl_max_handshake_message_size, kind_of: Fixnum, default: 10240
    attribute :admin__ssl_prevent_timing_side_channels, kind_of: [TrueClass, FalseClass], default: false
    attribute :admin__ssl_signature_algorithms, kind_of: String, default: ''
    attribute :admin__support_ssl2, kind_of: [TrueClass, FalseClass], default: false
    attribute :admin__support_ssl3, kind_of: [TrueClass, FalseClass], default: false
    attribute :admin__support_tls1, kind_of: [TrueClass, FalseClass], default: true
    attribute :admin__support_tls11, kind_of: [TrueClass, FalseClass], default: true
    attribute :admin__support_tls12, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__bootloader_password, kind_of: String, default: ''
    attribute :appliance__manage_ncipher, kind_of: [TrueClass, FalseClass], default: true
    attribute :appliance__nethsm_esn, kind_of: String, default: ''
    attribute :appliance__nethsm_hash, kind_of: String, default: ''
    attribute :appliance__nethsm_ip, kind_of: String, default: ''
    attribute :appliance__nethsm_ncipher_rfs, kind_of: String, default: ''
    attribute :appliance__return_path_routing_enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :aptimizer__max_dependent_fetch_size, kind_of: String, default: '2MB'
    attribute :aptimizer__max_original_content_buffer_size, kind_of: String, default: '2MB'
    attribute :aptimizer__watchdog_interval, kind_of: Fixnum, default: 300
    attribute :aptimizer__watchdog_limit, kind_of: Fixnum, default: 3
    attribute :auditlog__via_syslog, kind_of: [TrueClass, FalseClass], default: false
    attribute :autoscaler__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :bgp__as_number, kind_of: Fixnum, default: 65534
    attribute :bgp__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :cluster_comms__allow_update_default, kind_of: [TrueClass, FalseClass], default: true
    attribute :cluster_comms__allowed_update_hosts, kind_of: [Array, String], default: ["127.0.0.1"]
    attribute :cluster_comms__state_sync_interval, kind_of: Fixnum, default: 3
    attribute :cluster_comms__state_sync_timeout, kind_of: Fixnum, default: 6
    attribute :connection__idle_connections_max, kind_of: Fixnum, default: 0
    attribute :connection__idle_timeout, kind_of: Fixnum, default: 10
    attribute :connection__listen_queue_size, kind_of: Fixnum, default: 0
    attribute :connection__max_accepting, kind_of: Fixnum, default: 0
    attribute :connection__multiple_accept, kind_of: [TrueClass, FalseClass], default: false
    attribute :dns__max_ttl, kind_of: Fixnum, default: 86400
    attribute :dns__min_ttl, kind_of: Fixnum, default: 86400
    attribute :dns__negative_expiry, kind_of: Fixnum, default: 60
    attribute :dns__size, kind_of: Fixnum, default: 10867
    attribute :dns__timeout, kind_of: Fixnum, default: 12
    attribute :ec2__access_key_id, kind_of: String, default: ''
    attribute :ec2__secret_access_key, kind_of: String, default: ''
    attribute :ec2__verify_query_server_cert, kind_of: [TrueClass, FalseClass], default: false
    attribute :eventing__mail_interval, kind_of: Fixnum, default: 30
    attribute :eventing__max_attempts, kind_of: Fixnum, default: 10
    attribute :fault_tolerance__arp_count, kind_of: Fixnum, default: 10
    attribute :fault_tolerance__auto_failback, kind_of: [TrueClass, FalseClass], default: true
    attribute :fault_tolerance__frontend_check_ips, kind_of: [Array, String], default: ["%gateway%"]
    attribute :fault_tolerance__heartbeat_method, kind_of: String, default: 'unicast'
    attribute :fault_tolerance__igmp_interval, kind_of: Fixnum, default: 30
    attribute :fault_tolerance__monitor_interval, kind_of: Fixnum, default: 500
    attribute :fault_tolerance__monitor_timeout, kind_of: Fixnum, default: 5
    attribute :fault_tolerance__multicast_address, kind_of: String, default: '239.100.1.1:9090'
    attribute :fault_tolerance__unicast_port, kind_of: Fixnum, default: 9090
    attribute :fault_tolerance__use_bind_ip, kind_of: [TrueClass, FalseClass], default: false
    attribute :fault_tolerance__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :fips__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :ftp__data_bind_low, kind_of: [TrueClass, FalseClass], default: false
    attribute :glb__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :historical_activity__keep_days, kind_of: Fixnum, default: 90
    attribute :ip__appliance_returnpath, kind_of: [Array, String], default: []
    attribute :java__classpath, kind_of: String, default: ''
    attribute :java__command, kind_of: String, default: 'java -server'
    attribute :java__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :java__lib, kind_of: String, default: ''
    attribute :java__max_connections, kind_of: Fixnum, default: 256
    attribute :java__session_age, kind_of: Fixnum, default: 86400
    attribute :kerberos__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__error_level, kind_of: String, default: 'info'
    attribute :log__flush_time, kind_of: Fixnum, default: 5
    attribute :log__log_file, kind_of: String, default: '%zeushome%/zxtm/log/errors'
    attribute :log__rate, kind_of: Fixnum, default: 50
    attribute :log__reopen, kind_of: Fixnum, default: 30
    attribute :log__time, kind_of: Fixnum, default: 60
    attribute :ospfv2__area, kind_of: String, default: '0.0.0.1'
    attribute :ospfv2__area_type, kind_of: String, default: 'normal'
    attribute :ospfv2__authentication_key_id_a, kind_of: Fixnum, default: 0
    attribute :ospfv2__authentication_key_id_b, kind_of: Fixnum, default: 0
    attribute :ospfv2__authentication_shared_secret_a, kind_of: String, default: ''
    attribute :ospfv2__authentication_shared_secret_b, kind_of: String, default: ''
    attribute :ospfv2__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :ospfv2__hello_interval, kind_of: Fixnum, default: 10
    attribute :ospfv2__router_dead_interval, kind_of: Fixnum, default: 40
    attribute :protection__conncount_size, kind_of: String, default: '20MB'
    attribute :recent_connections__max_per_process, kind_of: Fixnum, default: 500
    attribute :recent_connections__retain_time, kind_of: Fixnum, default: 60
    attribute :recent_connections__snapshot_size, kind_of: Fixnum, default: 500
    attribute :rest_api__auth_timeout, kind_of: Fixnum, default: 120
    attribute :rest_api__enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :rest_api__http_max_header_length, kind_of: Fixnum, default: 4096
    attribute :rest_api__replicate_absolute, kind_of: Fixnum, default: 20
    attribute :rest_api__replicate_lull, kind_of: Fixnum, default: 5
    attribute :rest_api__replicate_timeout, kind_of: Fixnum, default: 10
    attribute :security__login_banner, kind_of: String, default: ''
    attribute :security__login_banner_accept, kind_of: [TrueClass, FalseClass], default: false
    attribute :security__login_delay, kind_of: Fixnum, default: 0
    attribute :security__max_login_attempts, kind_of: Fixnum, default: 0
    attribute :security__max_login_external, kind_of: [TrueClass, FalseClass], default: false
    attribute :security__max_login_suspension_time, kind_of: Fixnum, default: 15
    attribute :security__password_allow_consecutive_chars, kind_of: [TrueClass, FalseClass], default: true
    attribute :security__password_changes_per_day, kind_of: Fixnum, default: 0
    attribute :security__password_min_alpha_chars, kind_of: Fixnum, default: 0
    attribute :security__password_min_length, kind_of: Fixnum, default: 0
    attribute :security__password_min_numeric_chars, kind_of: Fixnum, default: 0
    attribute :security__password_min_special_chars, kind_of: Fixnum, default: 0
    attribute :security__password_min_uppercase_chars, kind_of: Fixnum, default: 0
    attribute :security__password_reuse_after, kind_of: Fixnum, default: 0
    attribute :security__post_login_banner, kind_of: String, default: ''
    attribute :security__track_unknown_users, kind_of: [TrueClass, FalseClass], default: false
    attribute :security__ui_page_banner, kind_of: String, default: ''
    attribute :session__asp_cache_size, kind_of: Fixnum, default: 32768
    attribute :session__ip_cache_size, kind_of: Fixnum, default: 32768
    attribute :session__j2ee_cache_size, kind_of: Fixnum, default: 32768
    attribute :session__ssl_cache_size, kind_of: Fixnum, default: 32768
    attribute :session__universal_cache_size, kind_of: Fixnum, default: 32768
    attribute :snmp__user_counters, kind_of: Fixnum, default: 10
    attribute :soap__idle_minutes, kind_of: Fixnum, default: 10
    attribute :ssl__cache_expiry, kind_of: Fixnum, default: 1800
    attribute :ssl__cache_per_virtualserver, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__cache_size, kind_of: Fixnum, default: 6151
    attribute :ssl__crl_mem_size, kind_of: String, default: '5MB'
    attribute :ssl__elliptic_curves, kind_of: [Array, String], default: []
    attribute :ssl__honor_fallback_scsv, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__insert_extra_fragment, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__max_handshake_message_size, kind_of: Fixnum, default: 10240
    attribute :ssl__ocsp_cache_size, kind_of: Fixnum, default: 2048
    attribute :ssl__ocsp_stapling_default_refresh_interval, kind_of: Fixnum, default: 60
    attribute :ssl__ocsp_stapling_maximum_refresh_interval, kind_of: Fixnum, default: 864000
    attribute :ssl__ocsp_stapling_mem_size, kind_of: String, default: '1MB'
    attribute :ssl__ocsp_stapling_time_tolerance, kind_of: Fixnum, default: 30
    attribute :ssl__ocsp_stapling_verify_response, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__prevent_timing_side_channels, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__signature_algorithms, kind_of: String, default: ''
    attribute :ssl__ssl3_allow_rehandshake, kind_of: String, default: 'safe'
    attribute :ssl__ssl3_ciphers, kind_of: String, default: ''
    attribute :ssl__ssl3_diffie_hellman_key_length, kind_of: String, default: 'dh_2048'
    attribute :ssl__ssl3_min_rehandshake_interval, kind_of: Fixnum, default: 1000
    attribute :ssl__support_ssl2, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__support_ssl3, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__support_tls1, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__support_tls1_1, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__support_tls1_2, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl_hardware__accel, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl_hardware__azure_client_id, kind_of: String, default: ''
    attribute :ssl_hardware__azure_client_secret, kind_of: String, default: ''
    attribute :ssl_hardware__azure_vault_url, kind_of: String, default: ''
    attribute :ssl_hardware__azure_verify_rest_api_cert, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl_hardware__driver_pkcs11_debug, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl_hardware__driver_pkcs11_lib, kind_of: String, default: ''
    attribute :ssl_hardware__driver_pkcs11_slot_desc, kind_of: String, default: ''
    attribute :ssl_hardware__driver_pkcs11_slot_type, kind_of: String, default: 'operator'
    attribute :ssl_hardware__driver_pkcs11_user_pin, kind_of: String, default: ''
    attribute :ssl_hardware__failure_count, kind_of: Fixnum, default: 5
    attribute :ssl_hardware__library, kind_of: String, default: 'none'
    attribute :trafficscript__array_elements, kind_of: Fixnum, default: 100000
    attribute :trafficscript__data_local_size, kind_of: String, default: '5%'
    attribute :trafficscript__data_size, kind_of: String, default: '5%'
    attribute :trafficscript__execution_time_warning, kind_of: Fixnum, default: 500
    attribute :trafficscript__max_instr, kind_of: Fixnum, default: 100000
    attribute :trafficscript__memory_warning, kind_of: Fixnum, default: 1048576
    attribute :trafficscript__regex_cache_size, kind_of: Fixnum, default: 57
    attribute :trafficscript__regex_match_limit, kind_of: Fixnum, default: 10000000
    attribute :trafficscript__regex_match_warn_percentage, kind_of: Fixnum, default: 5
    attribute :trafficscript__variable_pool_use, kind_of: [TrueClass, FalseClass], default: false
    attribute :web_cache__avg_path_length, kind_of: Fixnum, default: 512
    attribute :web_cache__disk, kind_of: [TrueClass, FalseClass], default: false
    attribute :web_cache__disk_dir, kind_of: String, default: '%zeushome%/zxtm/internal'
    attribute :web_cache__max_file_num, kind_of: Fixnum, default: 10000
    attribute :web_cache__max_file_size, kind_of: String, default: '2%'
    attribute :web_cache__max_path_length, kind_of: Fixnum, default: 2048
    attribute :web_cache__normalize_query, kind_of: [TrueClass, FalseClass], default: true
    attribute :web_cache__size, kind_of: String, default: '20%'
    attribute :web_cache__verbose, kind_of: [TrueClass, FalseClass], default: false

  end
end

class Chef
  class Provider::Vtm_global_settings < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_global_settings.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__accepting_delay] = new_resource.basic__accepting_delay
      @configHash[:basic__afm_enabled] = new_resource.basic__afm_enabled
      @configHash[:basic__chunk_size] = new_resource.basic__chunk_size
      @configHash[:basic__client_first_opt] = new_resource.basic__client_first_opt
      @configHash[:basic__license_servers] = new_resource.basic__license_servers
      @configHash[:basic__max_fds] = new_resource.basic__max_fds
      @configHash[:basic__monitor_memory_size] = new_resource.basic__monitor_memory_size
      @configHash[:basic__rate_class_limit] = new_resource.basic__rate_class_limit
      @configHash[:basic__shared_pool_size] = new_resource.basic__shared_pool_size
      @configHash[:basic__slm_class_limit] = new_resource.basic__slm_class_limit
      @configHash[:basic__so_rbuff_size] = new_resource.basic__so_rbuff_size
      @configHash[:basic__so_wbuff_size] = new_resource.basic__so_wbuff_size
      @configHash[:basic__socket_optimizations] = new_resource.basic__socket_optimizations
      @configHash[:basic__tip_class_limit] = new_resource.basic__tip_class_limit
      @configHash[:admin__honor_fallback_scsv] = new_resource.admin__honor_fallback_scsv
      @configHash[:admin__ssl3_allow_rehandshake] = new_resource.admin__ssl3_allow_rehandshake
      @configHash[:admin__ssl3_ciphers] = new_resource.admin__ssl3_ciphers
      @configHash[:admin__ssl3_diffie_hellman_key_length] = new_resource.admin__ssl3_diffie_hellman_key_length
      @configHash[:admin__ssl3_min_rehandshake_interval] = new_resource.admin__ssl3_min_rehandshake_interval
      @configHash[:admin__ssl_elliptic_curves] = new_resource.admin__ssl_elliptic_curves
      @configHash[:admin__ssl_insert_extra_fragment] = new_resource.admin__ssl_insert_extra_fragment
      @configHash[:admin__ssl_max_handshake_message_size] = new_resource.admin__ssl_max_handshake_message_size
      @configHash[:admin__ssl_prevent_timing_side_channels] = new_resource.admin__ssl_prevent_timing_side_channels
      @configHash[:admin__ssl_signature_algorithms] = new_resource.admin__ssl_signature_algorithms
      @configHash[:admin__support_ssl2] = new_resource.admin__support_ssl2
      @configHash[:admin__support_ssl3] = new_resource.admin__support_ssl3
      @configHash[:admin__support_tls1] = new_resource.admin__support_tls1
      @configHash[:admin__support_tls11] = new_resource.admin__support_tls11
      @configHash[:admin__support_tls12] = new_resource.admin__support_tls12
      @configHash[:appliance__bootloader_password] = new_resource.appliance__bootloader_password
      @configHash[:appliance__manage_ncipher] = new_resource.appliance__manage_ncipher
      @configHash[:appliance__nethsm_esn] = new_resource.appliance__nethsm_esn
      @configHash[:appliance__nethsm_hash] = new_resource.appliance__nethsm_hash
      @configHash[:appliance__nethsm_ip] = new_resource.appliance__nethsm_ip
      @configHash[:appliance__nethsm_ncipher_rfs] = new_resource.appliance__nethsm_ncipher_rfs
      @configHash[:appliance__return_path_routing_enabled] = new_resource.appliance__return_path_routing_enabled
      @configHash[:aptimizer__max_dependent_fetch_size] = new_resource.aptimizer__max_dependent_fetch_size
      @configHash[:aptimizer__max_original_content_buffer_size] = new_resource.aptimizer__max_original_content_buffer_size
      @configHash[:aptimizer__watchdog_interval] = new_resource.aptimizer__watchdog_interval
      @configHash[:aptimizer__watchdog_limit] = new_resource.aptimizer__watchdog_limit
      @configHash[:auditlog__via_syslog] = new_resource.auditlog__via_syslog
      @configHash[:autoscaler__verbose] = new_resource.autoscaler__verbose
      @configHash[:bgp__as_number] = new_resource.bgp__as_number
      @configHash[:bgp__enabled] = new_resource.bgp__enabled
      @configHash[:cluster_comms__allow_update_default] = new_resource.cluster_comms__allow_update_default
      @configHash[:cluster_comms__allowed_update_hosts] = new_resource.cluster_comms__allowed_update_hosts
      @configHash[:cluster_comms__state_sync_interval] = new_resource.cluster_comms__state_sync_interval
      @configHash[:cluster_comms__state_sync_timeout] = new_resource.cluster_comms__state_sync_timeout
      @configHash[:connection__idle_connections_max] = new_resource.connection__idle_connections_max
      @configHash[:connection__idle_timeout] = new_resource.connection__idle_timeout
      @configHash[:connection__listen_queue_size] = new_resource.connection__listen_queue_size
      @configHash[:connection__max_accepting] = new_resource.connection__max_accepting
      @configHash[:connection__multiple_accept] = new_resource.connection__multiple_accept
      @configHash[:dns__max_ttl] = new_resource.dns__max_ttl
      @configHash[:dns__min_ttl] = new_resource.dns__min_ttl
      @configHash[:dns__negative_expiry] = new_resource.dns__negative_expiry
      @configHash[:dns__size] = new_resource.dns__size
      @configHash[:dns__timeout] = new_resource.dns__timeout
      @configHash[:ec2__access_key_id] = new_resource.ec2__access_key_id
      @configHash[:ec2__secret_access_key] = new_resource.ec2__secret_access_key
      @configHash[:ec2__verify_query_server_cert] = new_resource.ec2__verify_query_server_cert
      @configHash[:eventing__mail_interval] = new_resource.eventing__mail_interval
      @configHash[:eventing__max_attempts] = new_resource.eventing__max_attempts
      @configHash[:fault_tolerance__arp_count] = new_resource.fault_tolerance__arp_count
      @configHash[:fault_tolerance__auto_failback] = new_resource.fault_tolerance__auto_failback
      @configHash[:fault_tolerance__frontend_check_ips] = new_resource.fault_tolerance__frontend_check_ips
      @configHash[:fault_tolerance__heartbeat_method] = new_resource.fault_tolerance__heartbeat_method
      @configHash[:fault_tolerance__igmp_interval] = new_resource.fault_tolerance__igmp_interval
      @configHash[:fault_tolerance__monitor_interval] = new_resource.fault_tolerance__monitor_interval
      @configHash[:fault_tolerance__monitor_timeout] = new_resource.fault_tolerance__monitor_timeout
      @configHash[:fault_tolerance__multicast_address] = new_resource.fault_tolerance__multicast_address
      @configHash[:fault_tolerance__unicast_port] = new_resource.fault_tolerance__unicast_port
      @configHash[:fault_tolerance__use_bind_ip] = new_resource.fault_tolerance__use_bind_ip
      @configHash[:fault_tolerance__verbose] = new_resource.fault_tolerance__verbose
      @configHash[:fips__enabled] = new_resource.fips__enabled
      @configHash[:ftp__data_bind_low] = new_resource.ftp__data_bind_low
      @configHash[:glb__verbose] = new_resource.glb__verbose
      @configHash[:historical_activity__keep_days] = new_resource.historical_activity__keep_days
      @configHash[:ip__appliance_returnpath] = new_resource.ip__appliance_returnpath
      @configHash[:java__classpath] = new_resource.java__classpath
      @configHash[:java__command] = new_resource.java__command
      @configHash[:java__enabled] = new_resource.java__enabled
      @configHash[:java__lib] = new_resource.java__lib
      @configHash[:java__max_connections] = new_resource.java__max_connections
      @configHash[:java__session_age] = new_resource.java__session_age
      @configHash[:kerberos__verbose] = new_resource.kerberos__verbose
      @configHash[:log__error_level] = new_resource.log__error_level
      @configHash[:log__flush_time] = new_resource.log__flush_time
      @configHash[:log__log_file] = new_resource.log__log_file
      @configHash[:log__rate] = new_resource.log__rate
      @configHash[:log__reopen] = new_resource.log__reopen
      @configHash[:log__time] = new_resource.log__time
      @configHash[:ospfv2__area] = new_resource.ospfv2__area
      @configHash[:ospfv2__area_type] = new_resource.ospfv2__area_type
      @configHash[:ospfv2__authentication_key_id_a] = new_resource.ospfv2__authentication_key_id_a
      @configHash[:ospfv2__authentication_key_id_b] = new_resource.ospfv2__authentication_key_id_b
      @configHash[:ospfv2__authentication_shared_secret_a] = new_resource.ospfv2__authentication_shared_secret_a
      @configHash[:ospfv2__authentication_shared_secret_b] = new_resource.ospfv2__authentication_shared_secret_b
      @configHash[:ospfv2__enabled] = new_resource.ospfv2__enabled
      @configHash[:ospfv2__hello_interval] = new_resource.ospfv2__hello_interval
      @configHash[:ospfv2__router_dead_interval] = new_resource.ospfv2__router_dead_interval
      @configHash[:protection__conncount_size] = new_resource.protection__conncount_size
      @configHash[:recent_connections__max_per_process] = new_resource.recent_connections__max_per_process
      @configHash[:recent_connections__retain_time] = new_resource.recent_connections__retain_time
      @configHash[:recent_connections__snapshot_size] = new_resource.recent_connections__snapshot_size
      @configHash[:rest_api__auth_timeout] = new_resource.rest_api__auth_timeout
      @configHash[:rest_api__enabled] = new_resource.rest_api__enabled
      @configHash[:rest_api__http_max_header_length] = new_resource.rest_api__http_max_header_length
      @configHash[:rest_api__replicate_absolute] = new_resource.rest_api__replicate_absolute
      @configHash[:rest_api__replicate_lull] = new_resource.rest_api__replicate_lull
      @configHash[:rest_api__replicate_timeout] = new_resource.rest_api__replicate_timeout
      @configHash[:security__login_banner] = new_resource.security__login_banner
      @configHash[:security__login_banner_accept] = new_resource.security__login_banner_accept
      @configHash[:security__login_delay] = new_resource.security__login_delay
      @configHash[:security__max_login_attempts] = new_resource.security__max_login_attempts
      @configHash[:security__max_login_external] = new_resource.security__max_login_external
      @configHash[:security__max_login_suspension_time] = new_resource.security__max_login_suspension_time
      @configHash[:security__password_allow_consecutive_chars] = new_resource.security__password_allow_consecutive_chars
      @configHash[:security__password_changes_per_day] = new_resource.security__password_changes_per_day
      @configHash[:security__password_min_alpha_chars] = new_resource.security__password_min_alpha_chars
      @configHash[:security__password_min_length] = new_resource.security__password_min_length
      @configHash[:security__password_min_numeric_chars] = new_resource.security__password_min_numeric_chars
      @configHash[:security__password_min_special_chars] = new_resource.security__password_min_special_chars
      @configHash[:security__password_min_uppercase_chars] = new_resource.security__password_min_uppercase_chars
      @configHash[:security__password_reuse_after] = new_resource.security__password_reuse_after
      @configHash[:security__post_login_banner] = new_resource.security__post_login_banner
      @configHash[:security__track_unknown_users] = new_resource.security__track_unknown_users
      @configHash[:security__ui_page_banner] = new_resource.security__ui_page_banner
      @configHash[:session__asp_cache_size] = new_resource.session__asp_cache_size
      @configHash[:session__ip_cache_size] = new_resource.session__ip_cache_size
      @configHash[:session__j2ee_cache_size] = new_resource.session__j2ee_cache_size
      @configHash[:session__ssl_cache_size] = new_resource.session__ssl_cache_size
      @configHash[:session__universal_cache_size] = new_resource.session__universal_cache_size
      @configHash[:snmp__user_counters] = new_resource.snmp__user_counters
      @configHash[:soap__idle_minutes] = new_resource.soap__idle_minutes
      @configHash[:ssl__cache_expiry] = new_resource.ssl__cache_expiry
      @configHash[:ssl__cache_per_virtualserver] = new_resource.ssl__cache_per_virtualserver
      @configHash[:ssl__cache_size] = new_resource.ssl__cache_size
      @configHash[:ssl__crl_mem_size] = new_resource.ssl__crl_mem_size
      @configHash[:ssl__elliptic_curves] = new_resource.ssl__elliptic_curves
      @configHash[:ssl__honor_fallback_scsv] = new_resource.ssl__honor_fallback_scsv
      @configHash[:ssl__insert_extra_fragment] = new_resource.ssl__insert_extra_fragment
      @configHash[:ssl__max_handshake_message_size] = new_resource.ssl__max_handshake_message_size
      @configHash[:ssl__ocsp_cache_size] = new_resource.ssl__ocsp_cache_size
      @configHash[:ssl__ocsp_stapling_default_refresh_interval] = new_resource.ssl__ocsp_stapling_default_refresh_interval
      @configHash[:ssl__ocsp_stapling_maximum_refresh_interval] = new_resource.ssl__ocsp_stapling_maximum_refresh_interval
      @configHash[:ssl__ocsp_stapling_mem_size] = new_resource.ssl__ocsp_stapling_mem_size
      @configHash[:ssl__ocsp_stapling_time_tolerance] = new_resource.ssl__ocsp_stapling_time_tolerance
      @configHash[:ssl__ocsp_stapling_verify_response] = new_resource.ssl__ocsp_stapling_verify_response
      @configHash[:ssl__prevent_timing_side_channels] = new_resource.ssl__prevent_timing_side_channels
      @configHash[:ssl__signature_algorithms] = new_resource.ssl__signature_algorithms
      @configHash[:ssl__ssl3_allow_rehandshake] = new_resource.ssl__ssl3_allow_rehandshake
      @configHash[:ssl__ssl3_ciphers] = new_resource.ssl__ssl3_ciphers
      @configHash[:ssl__ssl3_diffie_hellman_key_length] = new_resource.ssl__ssl3_diffie_hellman_key_length
      @configHash[:ssl__ssl3_min_rehandshake_interval] = new_resource.ssl__ssl3_min_rehandshake_interval
      @configHash[:ssl__support_ssl2] = new_resource.ssl__support_ssl2
      @configHash[:ssl__support_ssl3] = new_resource.ssl__support_ssl3
      @configHash[:ssl__support_tls1] = new_resource.ssl__support_tls1
      @configHash[:ssl__support_tls1_1] = new_resource.ssl__support_tls1_1
      @configHash[:ssl__support_tls1_2] = new_resource.ssl__support_tls1_2
      @configHash[:ssl_hardware__accel] = new_resource.ssl_hardware__accel
      @configHash[:ssl_hardware__azure_client_id] = new_resource.ssl_hardware__azure_client_id
      @configHash[:ssl_hardware__azure_client_secret] = new_resource.ssl_hardware__azure_client_secret
      @configHash[:ssl_hardware__azure_vault_url] = new_resource.ssl_hardware__azure_vault_url
      @configHash[:ssl_hardware__azure_verify_rest_api_cert] = new_resource.ssl_hardware__azure_verify_rest_api_cert
      @configHash[:ssl_hardware__driver_pkcs11_debug] = new_resource.ssl_hardware__driver_pkcs11_debug
      @configHash[:ssl_hardware__driver_pkcs11_lib] = new_resource.ssl_hardware__driver_pkcs11_lib
      @configHash[:ssl_hardware__driver_pkcs11_slot_desc] = new_resource.ssl_hardware__driver_pkcs11_slot_desc
      @configHash[:ssl_hardware__driver_pkcs11_slot_type] = new_resource.ssl_hardware__driver_pkcs11_slot_type
      @configHash[:ssl_hardware__driver_pkcs11_user_pin] = new_resource.ssl_hardware__driver_pkcs11_user_pin
      @configHash[:ssl_hardware__failure_count] = new_resource.ssl_hardware__failure_count
      @configHash[:ssl_hardware__library] = new_resource.ssl_hardware__library
      @configHash[:trafficscript__array_elements] = new_resource.trafficscript__array_elements
      @configHash[:trafficscript__data_local_size] = new_resource.trafficscript__data_local_size
      @configHash[:trafficscript__data_size] = new_resource.trafficscript__data_size
      @configHash[:trafficscript__execution_time_warning] = new_resource.trafficscript__execution_time_warning
      @configHash[:trafficscript__max_instr] = new_resource.trafficscript__max_instr
      @configHash[:trafficscript__memory_warning] = new_resource.trafficscript__memory_warning
      @configHash[:trafficscript__regex_cache_size] = new_resource.trafficscript__regex_cache_size
      @configHash[:trafficscript__regex_match_limit] = new_resource.trafficscript__regex_match_limit
      @configHash[:trafficscript__regex_match_warn_percentage] = new_resource.trafficscript__regex_match_warn_percentage
      @configHash[:trafficscript__variable_pool_use] = new_resource.trafficscript__variable_pool_use
      @configHash[:web_cache__avg_path_length] = new_resource.web_cache__avg_path_length
      @configHash[:web_cache__disk] = new_resource.web_cache__disk
      @configHash[:web_cache__disk_dir] = new_resource.web_cache__disk_dir
      @configHash[:web_cache__max_file_num] = new_resource.web_cache__max_file_num
      @configHash[:web_cache__max_file_size] = new_resource.web_cache__max_file_size
      @configHash[:web_cache__max_path_length] = new_resource.web_cache__max_path_length
      @configHash[:web_cache__normalize_query] = new_resource.web_cache__normalize_query
      @configHash[:web_cache__size] = new_resource.web_cache__size
      @configHash[:web_cache__verbose] = new_resource.web_cache__verbose

    end
  end
end

Chef::Platform.set(
        resource: :vtm_global_settings,
        provider: Chef::Provider::Vtm_global_settings,
)

