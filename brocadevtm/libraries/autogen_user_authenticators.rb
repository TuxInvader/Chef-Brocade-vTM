# === library: Vtm_user_authenticators

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_user_authenticators < Resource::VtmRest

    identity_attr :name
    provides :vtm_user_authenticators
    self.resource_name = :vtm_user_authenticators
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "user_authenticators"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/user_authenticators/"

    attribute :basic__type, kind_of: String, required: true

    attribute :basic__description, kind_of: String, default: ''
    attribute :basic__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :ldap__base_dn, kind_of: String, default: ''
    attribute :ldap__bind_dn, kind_of: String, default: ''
    attribute :ldap__dn_method, kind_of: String, default: 'none'
    attribute :ldap__fallback_group, kind_of: String, default: ''
    attribute :ldap__filter, kind_of: String, default: ''
    attribute :ldap__group_attribute, kind_of: String, default: ''
    attribute :ldap__group_field, kind_of: String, default: ''
    attribute :ldap__group_filter, kind_of: String, default: ''
    attribute :ldap__port, kind_of: Fixnum, default: 389
    attribute :ldap__search_dn, kind_of: String, default: ''
    attribute :ldap__search_password, kind_of: String, default: ''
    attribute :ldap__server, kind_of: String, default: ''
    attribute :ldap__timeout, kind_of: Fixnum, default: 30
    attribute :radius__fallback_group, kind_of: String, default: ''
    attribute :radius__group_attribute, kind_of: Fixnum, default: 1
    attribute :radius__group_vendor, kind_of: Fixnum, default: 7146
    attribute :radius__nas_identifier, kind_of: String, default: ''
    attribute :radius__nas_ip_address, kind_of: String, default: ''
    attribute :radius__port, kind_of: Fixnum, default: 1812
    attribute :radius__secret, kind_of: String, default: ''
    attribute :radius__server, kind_of: String, default: ''
    attribute :radius__timeout, kind_of: Fixnum, default: 30
    attribute :tacacs_plus__auth_type, kind_of: String, default: 'pap'
    attribute :tacacs_plus__fallback_group, kind_of: String, default: ''
    attribute :tacacs_plus__group_field, kind_of: String, default: 'permission-group'
    attribute :tacacs_plus__group_service, kind_of: String, default: 'zeus'
    attribute :tacacs_plus__port, kind_of: Fixnum, default: 49
    attribute :tacacs_plus__secret, kind_of: String, default: ''
    attribute :tacacs_plus__server, kind_of: String, default: ''
    attribute :tacacs_plus__timeout, kind_of: Fixnum, default: 30

  end
end

class Chef
  class Provider::Vtm_user_authenticators < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_user_authenticators.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__description] = new_resource.basic__description
      @configHash[:basic__enabled] = new_resource.basic__enabled
      @configHash[:ldap__base_dn] = new_resource.ldap__base_dn
      @configHash[:ldap__bind_dn] = new_resource.ldap__bind_dn
      @configHash[:ldap__dn_method] = new_resource.ldap__dn_method
      @configHash[:ldap__fallback_group] = new_resource.ldap__fallback_group
      @configHash[:ldap__filter] = new_resource.ldap__filter
      @configHash[:ldap__group_attribute] = new_resource.ldap__group_attribute
      @configHash[:ldap__group_field] = new_resource.ldap__group_field
      @configHash[:ldap__group_filter] = new_resource.ldap__group_filter
      @configHash[:ldap__port] = new_resource.ldap__port
      @configHash[:ldap__search_dn] = new_resource.ldap__search_dn
      @configHash[:ldap__search_password] = new_resource.ldap__search_password
      @configHash[:ldap__server] = new_resource.ldap__server
      @configHash[:ldap__timeout] = new_resource.ldap__timeout
      @configHash[:radius__fallback_group] = new_resource.radius__fallback_group
      @configHash[:radius__group_attribute] = new_resource.radius__group_attribute
      @configHash[:radius__group_vendor] = new_resource.radius__group_vendor
      @configHash[:radius__nas_identifier] = new_resource.radius__nas_identifier
      @configHash[:radius__nas_ip_address] = new_resource.radius__nas_ip_address
      @configHash[:radius__port] = new_resource.radius__port
      @configHash[:radius__secret] = new_resource.radius__secret
      @configHash[:radius__server] = new_resource.radius__server
      @configHash[:radius__timeout] = new_resource.radius__timeout
      @configHash[:tacacs_plus__auth_type] = new_resource.tacacs_plus__auth_type
      @configHash[:tacacs_plus__fallback_group] = new_resource.tacacs_plus__fallback_group
      @configHash[:tacacs_plus__group_field] = new_resource.tacacs_plus__group_field
      @configHash[:tacacs_plus__group_service] = new_resource.tacacs_plus__group_service
      @configHash[:tacacs_plus__port] = new_resource.tacacs_plus__port
      @configHash[:tacacs_plus__secret] = new_resource.tacacs_plus__secret
      @configHash[:tacacs_plus__server] = new_resource.tacacs_plus__server
      @configHash[:tacacs_plus__timeout] = new_resource.tacacs_plus__timeout

    end
  end
end

Chef::Platform.set(
        resource: :vtm_user_authenticators,
        provider: Chef::Provider::Vtm_user_authenticators,
)

