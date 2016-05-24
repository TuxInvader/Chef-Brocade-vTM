# === library: Vtm_kerberos_principals

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_kerberos_principals < Resource::VtmRest

    identity_attr :name
    provides :vtm_kerberos_principals
    self.resource_name = :vtm_kerberos_principals
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "kerberos_principals"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/kerberos/principals/"

    attribute :basic__keytab, kind_of: String, required: true
    attribute :basic__service, kind_of: String, required: true

    attribute :basic__kdcs, kind_of: [Array, String], default: []
    attribute :basic__krb5conf, kind_of: String, default: ''
    attribute :basic__realm, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_kerberos_principals < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_kerberos_principals.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__kdcs] = new_resource.basic__kdcs
      @configHash[:basic__krb5conf] = new_resource.basic__krb5conf
      @configHash[:basic__realm] = new_resource.basic__realm

    end
  end
end

Chef::Platform.set(
        resource: :vtm_kerberos_principals,
        provider: Chef::Provider::Vtm_kerberos_principals,
)

