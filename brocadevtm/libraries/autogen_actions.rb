# === Define: Vtm_actions

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_actions < Resource::VtmRest

    identity_attr :name
    provides :vtm_actions
    self.resource_name = :vtm_actions
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "actions"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/actions/"

    attribute :basic__type, kind_of: String, required: true

    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__syslog_msg_len_limit, kind_of: Fixnum, default: 1024
    attribute :basic__timeout, kind_of: Fixnum, default: 60
    attribute :basic__verbose, kind_of: [TrueClass, FalseClass], default: false
    attribute :email__server, kind_of: String, default: ''
    attribute :email__to, kind_of: [Array, String], default: []
    attribute :log__file, kind_of: String, default: ''
    attribute :log__from, kind_of: String, default: 'stingraytrafficmanager@%hostname%'
    attribute :program__arguments, kind_of: [Array, String], default: []
    attribute :program__program, kind_of: String, default: ''
    attribute :soap__additional_data, kind_of: String, default: ''
    attribute :soap__password, kind_of: String, default: ''
    attribute :soap__proxy, kind_of: String, default: ''
    attribute :soap__username, kind_of: String, default: ''
    attribute :syslog__sysloghost, kind_of: String, default: ''
    attribute :trap__auth_password, kind_of: String, default: ''
    attribute :trap__community, kind_of: String, default: ''
    attribute :trap__hash_algorithm, kind_of: String, default: 'md5'
    attribute :trap__priv_password, kind_of: String, default: ''
    attribute :trap__traphost, kind_of: String, default: ''
    attribute :trap__username, kind_of: String, default: ''
    attribute :trap__version, kind_of: String, default: 'snmpv1'

  end
end

class Chef
  class Provider::Vtm_actions < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_actions.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__syslog_msg_len_limit] = new_resource.basic__syslog_msg_len_limit
      @configHash[:basic__timeout] = new_resource.basic__timeout
      @configHash[:basic__verbose] = new_resource.basic__verbose
      @configHash[:email__server] = new_resource.email__server
      @configHash[:email__to] = new_resource.email__to
      @configHash[:log__file] = new_resource.log__file
      @configHash[:log__from] = new_resource.log__from
      @configHash[:program__arguments] = new_resource.program__arguments
      @configHash[:program__program] = new_resource.program__program
      @configHash[:soap__additional_data] = new_resource.soap__additional_data
      @configHash[:soap__password] = new_resource.soap__password
      @configHash[:soap__proxy] = new_resource.soap__proxy
      @configHash[:soap__username] = new_resource.soap__username
      @configHash[:syslog__sysloghost] = new_resource.syslog__sysloghost
      @configHash[:trap__auth_password] = new_resource.trap__auth_password
      @configHash[:trap__community] = new_resource.trap__community
      @configHash[:trap__hash_algorithm] = new_resource.trap__hash_algorithm
      @configHash[:trap__priv_password] = new_resource.trap__priv_password
      @configHash[:trap__traphost] = new_resource.trap__traphost
      @configHash[:trap__username] = new_resource.trap__username
      @configHash[:trap__version] = new_resource.trap__version

    end
  end
end

Chef::Platform.set(
        resource: :vtm_actions,
        provider: Chef::Provider::Vtm_actions,
)

