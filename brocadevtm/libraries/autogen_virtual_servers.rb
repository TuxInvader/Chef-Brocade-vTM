# === Define: Vtm_virtual_servers

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_virtual_servers < Resource::VtmRest

    identity_attr :name
    provides :vtm_virtual_servers
    self.resource_name = :vtm_virtual_servers
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "virtual_servers"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/virtual_servers/"

    attribute :basic__pool, kind_of: String, required: true
    attribute :basic__port, kind_of: Fixnum, required: true

    attribute :basic__add_cluster_ip, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__add_x_forwarded_for, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__add_x_forwarded_proto, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__bandwidth_class, kind_of: String, default: ''
    attribute :basic__close_with_rst, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__completionrules, kind_of: [Array, String], default: []
    attribute :basic__connect_timeout, kind_of: Fixnum, default: 10
    attribute :basic__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__ftp_force_server_secure, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__glb_services, kind_of: [Array, String], default: []
    attribute :basic__listen_on_any, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__listen_on_hosts, kind_of: [Array, String], default: []
    attribute :basic__listen_on_traffic_ips, kind_of: [Array, String], default: []
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__protection_class, kind_of: String, default: ''
    attribute :basic__protocol, kind_of: String, default: 'http'
    attribute :basic__request_rules, kind_of: [Array, String], default: []
    attribute :basic__response_rules, kind_of: [Array, String], default: []
    attribute :basic__slm_class, kind_of: String, default: ''
    attribute :basic__so_nagle, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__ssl_client_cert_headers, kind_of: String, default: 'none'
    attribute :basic__ssl_decrypt, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__ssl_honor_fallback_scsv, kind_of: String, default: 'use_default'
    attribute :aptimizer__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :aptimizer__profile, kind_of: [Array, String], default: []
    attribute :connection__keepalive, kind_of: [TrueClass, FalseClass], default: true
    attribute :connection__keepalive_timeout, kind_of: Fixnum, default: 10
    attribute :connection__max_client_buffer, kind_of: Fixnum, default: 65536
    attribute :connection__max_server_buffer, kind_of: Fixnum, default: 65536
    attribute :connection__max_transaction_duration, kind_of: Fixnum, default: 0
    attribute :connection__server_first_banner, kind_of: String, default: ''
    attribute :connection__timeout, kind_of: Fixnum, default: 300
    attribute :connection_errors__error_file, kind_of: String, default: 'Default'
    attribute :cookie__domain, kind_of: String, default: 'no_rewrite'
    attribute :cookie__new_domain, kind_of: String, default: ''
    attribute :cookie__path_regex, kind_of: String, default: ''
    attribute :cookie__path_replace, kind_of: String, default: ''
    attribute :cookie__secure, kind_of: String, default: 'no_modify'
    attribute :dns__edns_udpsize, kind_of: Fixnum, default: 4096
    attribute :dns__max_udpsize, kind_of: Fixnum, default: 4096
    attribute :dns__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :dns__zones, kind_of: [Array, String], default: []
    attribute :ftp__data_source_port, kind_of: Fixnum, default: 0
    attribute :ftp__force_client_secure, kind_of: [TrueClass, FalseClass], default: true
    attribute :ftp__port_range_high, kind_of: Fixnum, default: 0
    attribute :ftp__port_range_low, kind_of: Fixnum, default: 0
    attribute :ftp__ssl_data, kind_of: [TrueClass, FalseClass], default: true
    attribute :gzip__compress_level, kind_of: Fixnum, default: 1
    attribute :gzip__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :gzip__include_mime, kind_of: [Array, String], default: ["text/html", "text/plain"]
    attribute :gzip__max_size, kind_of: Fixnum, default: 10000000
    attribute :gzip__min_size, kind_of: Fixnum, default: 1000
    attribute :gzip__no_size, kind_of: [TrueClass, FalseClass], default: true
    attribute :http__chunk_overhead_forwarding, kind_of: String, default: 'lazy'
    attribute :http__location_regex, kind_of: String, default: ''
    attribute :http__location_replace, kind_of: String, default: ''
    attribute :http__location_rewrite, kind_of: String, default: 'if_host_matches'
    attribute :http__mime_default, kind_of: String, default: 'text/plain'
    attribute :http__mime_detect, kind_of: [TrueClass, FalseClass], default: false
    attribute :kerberos_protocol_transition__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :kerberos_protocol_transition__principal, kind_of: String, default: ''
    attribute :kerberos_protocol_transition__target, kind_of: String, default: ''
    attribute :log__client_connection_failures, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__filename, kind_of: String, default: '%zeushome%/zxtm/log/%v.log'
    attribute :log__format, kind_of: String, default: '%h %l %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\"'
    attribute :log__save_all, kind_of: [TrueClass, FalseClass], default: true
    attribute :log__server_connection_failures, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__session_persistence_verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__ssl_failures, kind_of: [TrueClass, FalseClass], default: false
    attribute :recent_connections__enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :recent_connections__save_all, kind_of: [TrueClass, FalseClass], default: false
    attribute :request_tracing__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :request_tracing__trace_io, kind_of: [TrueClass, FalseClass], default: false
    attribute :rtsp__streaming_port_range_high, kind_of: Fixnum, default: 0
    attribute :rtsp__streaming_port_range_low, kind_of: Fixnum, default: 0
    attribute :rtsp__streaming_timeout, kind_of: Fixnum, default: 30
    attribute :sip__dangerous_requests, kind_of: String, default: 'node'
    attribute :sip__follow_route, kind_of: [TrueClass, FalseClass], default: true
    attribute :sip__max_connection_mem, kind_of: Fixnum, default: 65536
    attribute :sip__mode, kind_of: String, default: 'sip_gateway'
    attribute :sip__rewrite_uri, kind_of: [TrueClass, FalseClass], default: false
    attribute :sip__streaming_port_range_high, kind_of: Fixnum, default: 0
    attribute :sip__streaming_port_range_low, kind_of: Fixnum, default: 0
    attribute :sip__streaming_timeout, kind_of: Fixnum, default: 60
    attribute :sip__timeout_messages, kind_of: [TrueClass, FalseClass], default: true
    attribute :sip__transaction_timeout, kind_of: Fixnum, default: 30
    attribute :smtp__expect_starttls, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__add_http_headers, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__client_cert_cas, kind_of: [Array, String], default: []
    attribute :ssl__issued_certs_never_expire, kind_of: [Array, String], default: []
    attribute :ssl__ocsp_enable, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__ocsp_issuers, kind_of: [Array, String], default: []
    attribute :ssl__ocsp_max_response_age, kind_of: Fixnum, default: 0
    attribute :ssl__ocsp_stapling, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__ocsp_time_tolerance, kind_of: Fixnum, default: 30
    attribute :ssl__ocsp_timeout, kind_of: Fixnum, default: 10
    attribute :ssl__prefer_sslv3, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssl__request_client_cert, kind_of: String, default: 'dont_request'
    attribute :ssl__send_close_alerts, kind_of: [TrueClass, FalseClass], default: true
    attribute :ssl__server_cert_default, kind_of: String, default: ''
    attribute :ssl__server_cert_host_mapping, kind_of: [Array, String], default: []
    attribute :ssl__signature_algorithms, kind_of: String, default: ''
    attribute :ssl__ssl_ciphers, kind_of: String, default: ''
    attribute :ssl__ssl_support_ssl2, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_ssl3, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1_1, kind_of: String, default: 'use_default'
    attribute :ssl__ssl_support_tls1_2, kind_of: String, default: 'use_default'
    attribute :ssl__trust_magic, kind_of: [TrueClass, FalseClass], default: false
    attribute :syslog__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :syslog__format, kind_of: String, default: '%h %l %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\"'
    attribute :syslog__ip_end_point, kind_of: String, default: ''
    attribute :syslog__msg_len_limit, kind_of: Fixnum, default: 1024
    attribute :tcp__proxy_close, kind_of: [TrueClass, FalseClass], default: false
    attribute :udp__end_point_persistence, kind_of: [TrueClass, FalseClass], default: true
    attribute :udp__port_smp, kind_of: [TrueClass, FalseClass], default: false
    attribute :udp__response_datagrams_expected, kind_of: Fixnum, default: 1
    attribute :udp__timeout, kind_of: Fixnum, default: 7
    attribute :web_cache__control_out, kind_of: String, default: ''
    attribute :web_cache__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :web_cache__error_page_time, kind_of: Fixnum, default: 30
    attribute :web_cache__max_time, kind_of: Fixnum, default: 600
    attribute :web_cache__refresh_time, kind_of: Fixnum, default: 2

  end
end

class Chef
  class Provider::Vtm_virtual_servers < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_virtual_servers.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__add_cluster_ip] = new_resource.basic__add_cluster_ip
      @configHash[:basic__add_x_forwarded_for] = new_resource.basic__add_x_forwarded_for
      @configHash[:basic__add_x_forwarded_proto] = new_resource.basic__add_x_forwarded_proto
      @configHash[:basic__bandwidth_class] = new_resource.basic__bandwidth_class
      @configHash[:basic__close_with_rst] = new_resource.basic__close_with_rst
      @configHash[:basic__completionrules] = new_resource.basic__completionrules
      @configHash[:basic__connect_timeout] = new_resource.basic__connect_timeout
      @configHash[:basic__enabled] = new_resource.basic__enabled
      @configHash[:basic__ftp_force_server_secure] = new_resource.basic__ftp_force_server_secure
      @configHash[:basic__glb_services] = new_resource.basic__glb_services
      @configHash[:basic__listen_on_any] = new_resource.basic__listen_on_any
      @configHash[:basic__listen_on_hosts] = new_resource.basic__listen_on_hosts
      @configHash[:basic__listen_on_traffic_ips] = new_resource.basic__listen_on_traffic_ips
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__protection_class] = new_resource.basic__protection_class
      @configHash[:basic__protocol] = new_resource.basic__protocol
      @configHash[:basic__request_rules] = new_resource.basic__request_rules
      @configHash[:basic__response_rules] = new_resource.basic__response_rules
      @configHash[:basic__slm_class] = new_resource.basic__slm_class
      @configHash[:basic__so_nagle] = new_resource.basic__so_nagle
      @configHash[:basic__ssl_client_cert_headers] = new_resource.basic__ssl_client_cert_headers
      @configHash[:basic__ssl_decrypt] = new_resource.basic__ssl_decrypt
      @configHash[:basic__ssl_honor_fallback_scsv] = new_resource.basic__ssl_honor_fallback_scsv
      @configHash[:aptimizer__enabled] = new_resource.aptimizer__enabled
      @configHash[:aptimizer__profile] = new_resource.aptimizer__profile
      @configHash[:connection__keepalive] = new_resource.connection__keepalive
      @configHash[:connection__keepalive_timeout] = new_resource.connection__keepalive_timeout
      @configHash[:connection__max_client_buffer] = new_resource.connection__max_client_buffer
      @configHash[:connection__max_server_buffer] = new_resource.connection__max_server_buffer
      @configHash[:connection__max_transaction_duration] = new_resource.connection__max_transaction_duration
      @configHash[:connection__server_first_banner] = new_resource.connection__server_first_banner
      @configHash[:connection__timeout] = new_resource.connection__timeout
      @configHash[:connection_errors__error_file] = new_resource.connection_errors__error_file
      @configHash[:cookie__domain] = new_resource.cookie__domain
      @configHash[:cookie__new_domain] = new_resource.cookie__new_domain
      @configHash[:cookie__path_regex] = new_resource.cookie__path_regex
      @configHash[:cookie__path_replace] = new_resource.cookie__path_replace
      @configHash[:cookie__secure] = new_resource.cookie__secure
      @configHash[:dns__edns_udpsize] = new_resource.dns__edns_udpsize
      @configHash[:dns__max_udpsize] = new_resource.dns__max_udpsize
      @configHash[:dns__verbose] = new_resource.dns__verbose
      @configHash[:dns__zones] = new_resource.dns__zones
      @configHash[:ftp__data_source_port] = new_resource.ftp__data_source_port
      @configHash[:ftp__force_client_secure] = new_resource.ftp__force_client_secure
      @configHash[:ftp__port_range_high] = new_resource.ftp__port_range_high
      @configHash[:ftp__port_range_low] = new_resource.ftp__port_range_low
      @configHash[:ftp__ssl_data] = new_resource.ftp__ssl_data
      @configHash[:gzip__compress_level] = new_resource.gzip__compress_level
      @configHash[:gzip__enabled] = new_resource.gzip__enabled
      @configHash[:gzip__include_mime] = new_resource.gzip__include_mime
      @configHash[:gzip__max_size] = new_resource.gzip__max_size
      @configHash[:gzip__min_size] = new_resource.gzip__min_size
      @configHash[:gzip__no_size] = new_resource.gzip__no_size
      @configHash[:http__chunk_overhead_forwarding] = new_resource.http__chunk_overhead_forwarding
      @configHash[:http__location_regex] = new_resource.http__location_regex
      @configHash[:http__location_replace] = new_resource.http__location_replace
      @configHash[:http__location_rewrite] = new_resource.http__location_rewrite
      @configHash[:http__mime_default] = new_resource.http__mime_default
      @configHash[:http__mime_detect] = new_resource.http__mime_detect
      @configHash[:kerberos_protocol_transition__enabled] = new_resource.kerberos_protocol_transition__enabled
      @configHash[:kerberos_protocol_transition__principal] = new_resource.kerberos_protocol_transition__principal
      @configHash[:kerberos_protocol_transition__target] = new_resource.kerberos_protocol_transition__target
      @configHash[:log__client_connection_failures] = new_resource.log__client_connection_failures
      @configHash[:log__enabled] = new_resource.log__enabled
      @configHash[:log__filename] = new_resource.log__filename
      @configHash[:log__format] = new_resource.log__format
      @configHash[:log__save_all] = new_resource.log__save_all
      @configHash[:log__server_connection_failures] = new_resource.log__server_connection_failures
      @configHash[:log__session_persistence_verbose] = new_resource.log__session_persistence_verbose
      @configHash[:log__ssl_failures] = new_resource.log__ssl_failures
      @configHash[:recent_connections__enabled] = new_resource.recent_connections__enabled
      @configHash[:recent_connections__save_all] = new_resource.recent_connections__save_all
      @configHash[:request_tracing__enabled] = new_resource.request_tracing__enabled
      @configHash[:request_tracing__trace_io] = new_resource.request_tracing__trace_io
      @configHash[:rtsp__streaming_port_range_high] = new_resource.rtsp__streaming_port_range_high
      @configHash[:rtsp__streaming_port_range_low] = new_resource.rtsp__streaming_port_range_low
      @configHash[:rtsp__streaming_timeout] = new_resource.rtsp__streaming_timeout
      @configHash[:sip__dangerous_requests] = new_resource.sip__dangerous_requests
      @configHash[:sip__follow_route] = new_resource.sip__follow_route
      @configHash[:sip__max_connection_mem] = new_resource.sip__max_connection_mem
      @configHash[:sip__mode] = new_resource.sip__mode
      @configHash[:sip__rewrite_uri] = new_resource.sip__rewrite_uri
      @configHash[:sip__streaming_port_range_high] = new_resource.sip__streaming_port_range_high
      @configHash[:sip__streaming_port_range_low] = new_resource.sip__streaming_port_range_low
      @configHash[:sip__streaming_timeout] = new_resource.sip__streaming_timeout
      @configHash[:sip__timeout_messages] = new_resource.sip__timeout_messages
      @configHash[:sip__transaction_timeout] = new_resource.sip__transaction_timeout
      @configHash[:smtp__expect_starttls] = new_resource.smtp__expect_starttls
      @configHash[:ssl__add_http_headers] = new_resource.ssl__add_http_headers
      @configHash[:ssl__client_cert_cas] = new_resource.ssl__client_cert_cas
      @configHash[:ssl__issued_certs_never_expire] = new_resource.ssl__issued_certs_never_expire
      @configHash[:ssl__ocsp_enable] = new_resource.ssl__ocsp_enable
      @configHash[:ssl__ocsp_issuers] = new_resource.ssl__ocsp_issuers
      @configHash[:ssl__ocsp_max_response_age] = new_resource.ssl__ocsp_max_response_age
      @configHash[:ssl__ocsp_stapling] = new_resource.ssl__ocsp_stapling
      @configHash[:ssl__ocsp_time_tolerance] = new_resource.ssl__ocsp_time_tolerance
      @configHash[:ssl__ocsp_timeout] = new_resource.ssl__ocsp_timeout
      @configHash[:ssl__prefer_sslv3] = new_resource.ssl__prefer_sslv3
      @configHash[:ssl__request_client_cert] = new_resource.ssl__request_client_cert
      @configHash[:ssl__send_close_alerts] = new_resource.ssl__send_close_alerts
      @configHash[:ssl__server_cert_default] = new_resource.ssl__server_cert_default
      @configHash[:ssl__server_cert_host_mapping] = new_resource.ssl__server_cert_host_mapping
      @configHash[:ssl__signature_algorithms] = new_resource.ssl__signature_algorithms
      @configHash[:ssl__ssl_ciphers] = new_resource.ssl__ssl_ciphers
      @configHash[:ssl__ssl_support_ssl2] = new_resource.ssl__ssl_support_ssl2
      @configHash[:ssl__ssl_support_ssl3] = new_resource.ssl__ssl_support_ssl3
      @configHash[:ssl__ssl_support_tls1] = new_resource.ssl__ssl_support_tls1
      @configHash[:ssl__ssl_support_tls1_1] = new_resource.ssl__ssl_support_tls1_1
      @configHash[:ssl__ssl_support_tls1_2] = new_resource.ssl__ssl_support_tls1_2
      @configHash[:ssl__trust_magic] = new_resource.ssl__trust_magic
      @configHash[:syslog__enabled] = new_resource.syslog__enabled
      @configHash[:syslog__format] = new_resource.syslog__format
      @configHash[:syslog__ip_end_point] = new_resource.syslog__ip_end_point
      @configHash[:syslog__msg_len_limit] = new_resource.syslog__msg_len_limit
      @configHash[:tcp__proxy_close] = new_resource.tcp__proxy_close
      @configHash[:udp__end_point_persistence] = new_resource.udp__end_point_persistence
      @configHash[:udp__port_smp] = new_resource.udp__port_smp
      @configHash[:udp__response_datagrams_expected] = new_resource.udp__response_datagrams_expected
      @configHash[:udp__timeout] = new_resource.udp__timeout
      @configHash[:web_cache__control_out] = new_resource.web_cache__control_out
      @configHash[:web_cache__enabled] = new_resource.web_cache__enabled
      @configHash[:web_cache__error_page_time] = new_resource.web_cache__error_page_time
      @configHash[:web_cache__max_time] = new_resource.web_cache__max_time
      @configHash[:web_cache__refresh_time] = new_resource.web_cache__refresh_time

    end
  end
end

Chef::Platform.set(
        resource: :vtm_virtual_servers,
        provider: Chef::Provider::Vtm_virtual_servers,
)

