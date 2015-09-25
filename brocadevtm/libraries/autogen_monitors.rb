# === Define: Vtm_monitors

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_monitors < Resource::VtmRest

    identity_attr :name
    provides :vtm_monitors
    self.resource_name = :vtm_monitors
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "monitors"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/monitors/"


    attribute :basic__back_off, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__delay, kind_of: Fixnum, default: 3
    attribute :basic__failures, kind_of: Fixnum, default: 3
    attribute :basic__machine, kind_of: String, default: ''
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__scope, kind_of: String, default: 'pernode'
    attribute :basic__timeout, kind_of: Fixnum, default: 3
    attribute :basic__type, kind_of: String, default: 'ping'
    attribute :basic__use_ssl, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :http__authentication, kind_of: String, default: ''
    attribute :http__body_regex, kind_of: String, default: ''
    attribute :http__host_header, kind_of: String, default: ''
    attribute :http__path, kind_of: String, default: '/'
    attribute :http__status_regex, kind_of: String, default: '^[234][0-9][0-9]$'
    attribute :rtsp__body_regex, kind_of: String, default: ''
    attribute :rtsp__path, kind_of: String, default: '/'
    attribute :rtsp__status_regex, kind_of: String, default: '^[234][0-9][0-9]$'
    attribute :script__arguments, kind_of: [Array, String], default: []
    attribute :script__program, kind_of: String, default: ''
    attribute :sip__body_regex, kind_of: String, default: ''
    attribute :sip__status_regex, kind_of: String, default: '^[234][0-9][0-9]$'
    attribute :sip__transport, kind_of: String, default: 'udp'
    attribute :tcp__close_string, kind_of: String, default: ''
    attribute :tcp__max_response_len, kind_of: Fixnum, default: 2048
    attribute :tcp__response_regex, kind_of: String, default: '.+'
    attribute :tcp__write_string, kind_of: String, default: ''
    attribute :udp__accept_all, kind_of: [TrueClass, FalseClass], default: false

  end
end

class Chef
  class Provider::Vtm_monitors < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_monitors.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__back_off] = new_resource.basic__back_off
      @configHash[:basic__delay] = new_resource.basic__delay
      @configHash[:basic__failures] = new_resource.basic__failures
      @configHash[:basic__machine] = new_resource.basic__machine
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__scope] = new_resource.basic__scope
      @configHash[:basic__timeout] = new_resource.basic__timeout
      @configHash[:basic__type] = new_resource.basic__type
      @configHash[:basic__use_ssl] = new_resource.basic__use_ssl
      @configHash[:basic__verbose] = new_resource.basic__verbose
      @configHash[:http__authentication] = new_resource.http__authentication
      @configHash[:http__body_regex] = new_resource.http__body_regex
      @configHash[:http__host_header] = new_resource.http__host_header
      @configHash[:http__path] = new_resource.http__path
      @configHash[:http__status_regex] = new_resource.http__status_regex
      @configHash[:rtsp__body_regex] = new_resource.rtsp__body_regex
      @configHash[:rtsp__path] = new_resource.rtsp__path
      @configHash[:rtsp__status_regex] = new_resource.rtsp__status_regex
      @configHash[:script__arguments] = new_resource.script__arguments
      @configHash[:script__program] = new_resource.script__program
      @configHash[:sip__body_regex] = new_resource.sip__body_regex
      @configHash[:sip__status_regex] = new_resource.sip__status_regex
      @configHash[:sip__transport] = new_resource.sip__transport
      @configHash[:tcp__close_string] = new_resource.tcp__close_string
      @configHash[:tcp__max_response_len] = new_resource.tcp__max_response_len
      @configHash[:tcp__response_regex] = new_resource.tcp__response_regex
      @configHash[:tcp__write_string] = new_resource.tcp__write_string
      @configHash[:udp__accept_all] = new_resource.udp__accept_all

    end
  end
end

Chef::Platform.set(
        resource: :vtm_monitors,
        provider: Chef::Provider::Vtm_monitors,
)

