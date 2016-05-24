# === library: Vtm_rule_authenticators

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_rule_authenticators < Resource::VtmRest

    identity_attr :name
    provides :vtm_rule_authenticators
    self.resource_name = :vtm_rule_authenticators
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "rule_authenticators"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/rule_authenticators/"


    attribute :basic__host, kind_of: String, default: ''
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__port, kind_of: Fixnum, default: 389
    attribute :ldap__attributes, kind_of: [Array, String], default: []
    attribute :ldap__bind_dn, kind_of: String, default: ''
    attribute :ldap__bind_password, kind_of: String, default: ''
    attribute :ldap__filter, kind_of: String, default: ''
    attribute :ldap__filter_base_dn, kind_of: String, default: ''
    attribute :ldap__ssl_cert, kind_of: String, default: ''
    attribute :ldap__ssl_enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :ldap__ssl_type, kind_of: String, default: 'ldaps'

  end
end

class Chef
  class Provider::Vtm_rule_authenticators < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_rule_authenticators.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__host] = new_resource.basic__host
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__port] = new_resource.basic__port
      @configHash[:ldap__attributes] = new_resource.ldap__attributes
      @configHash[:ldap__bind_dn] = new_resource.ldap__bind_dn
      @configHash[:ldap__bind_password] = new_resource.ldap__bind_password
      @configHash[:ldap__filter] = new_resource.ldap__filter
      @configHash[:ldap__filter_base_dn] = new_resource.ldap__filter_base_dn
      @configHash[:ldap__ssl_cert] = new_resource.ldap__ssl_cert
      @configHash[:ldap__ssl_enabled] = new_resource.ldap__ssl_enabled
      @configHash[:ldap__ssl_type] = new_resource.ldap__ssl_type

    end
  end
end

Chef::Platform.set(
        resource: :vtm_rule_authenticators,
        provider: Chef::Provider::Vtm_rule_authenticators,
)

