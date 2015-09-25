# === Define: Vtm_protection

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_protection < Resource::VtmRest

    identity_attr :name
    provides :vtm_protection
    self.resource_name = :vtm_protection
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "protection"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/protection/"


    attribute :basic__debug, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__enabled, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__log_time, kind_of: Fixnum, default: 60
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__per_process_connection_count, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__rule, kind_of: String, default: ''
    attribute :basic__testing, kind_of: [TrueClass, FalseClass], default: false
    attribute :access_restriction__allowed, kind_of: [Array, String], default: []
    attribute :access_restriction__banned, kind_of: [Array, String], default: []
    attribute :connection_limiting__max_10_connections, kind_of: Fixnum, default: 200
    attribute :connection_limiting__max_1_connections, kind_of: Fixnum, default: 30
    attribute :connection_limiting__max_connection_rate, kind_of: Fixnum, default: 0
    attribute :connection_limiting__min_connections, kind_of: Fixnum, default: 4
    attribute :connection_limiting__rate_timer, kind_of: Fixnum, default: 60
    attribute :http__check_rfc2396, kind_of: [TrueClass, FalseClass], default: false
    attribute :http__max_body_length, kind_of: Fixnum, default: 0
    attribute :http__max_header_length, kind_of: Fixnum, default: 0
    attribute :http__max_request_length, kind_of: Fixnum, default: 0
    attribute :http__max_url_length, kind_of: Fixnum, default: 0
    attribute :http__reject_binary, kind_of: [TrueClass, FalseClass], default: false
    attribute :http__send_error_page, kind_of: [TrueClass, FalseClass], default: true

  end
end

class Chef
  class Provider::Vtm_protection < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_protection.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__debug] = new_resource.basic__debug
      @configHash[:basic__enabled] = new_resource.basic__enabled
      @configHash[:basic__log_time] = new_resource.basic__log_time
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__per_process_connection_count] = new_resource.basic__per_process_connection_count
      @configHash[:basic__rule] = new_resource.basic__rule
      @configHash[:basic__testing] = new_resource.basic__testing
      @configHash[:access_restriction__allowed] = new_resource.access_restriction__allowed
      @configHash[:access_restriction__banned] = new_resource.access_restriction__banned
      @configHash[:connection_limiting__max_10_connections] = new_resource.connection_limiting__max_10_connections
      @configHash[:connection_limiting__max_1_connections] = new_resource.connection_limiting__max_1_connections
      @configHash[:connection_limiting__max_connection_rate] = new_resource.connection_limiting__max_connection_rate
      @configHash[:connection_limiting__min_connections] = new_resource.connection_limiting__min_connections
      @configHash[:connection_limiting__rate_timer] = new_resource.connection_limiting__rate_timer
      @configHash[:http__check_rfc2396] = new_resource.http__check_rfc2396
      @configHash[:http__max_body_length] = new_resource.http__max_body_length
      @configHash[:http__max_header_length] = new_resource.http__max_header_length
      @configHash[:http__max_request_length] = new_resource.http__max_request_length
      @configHash[:http__max_url_length] = new_resource.http__max_url_length
      @configHash[:http__reject_binary] = new_resource.http__reject_binary
      @configHash[:http__send_error_page] = new_resource.http__send_error_page

    end
  end
end

Chef::Platform.set(
        resource: :vtm_protection,
        provider: Chef::Provider::Vtm_protection,
)

