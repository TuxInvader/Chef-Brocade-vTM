# === library: Vtm_kerberos_krb5confs

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_kerberos_krb5confs < Resource::VtmRest

    identity_attr :name
    provides :vtm_kerberos_krb5confs
    self.resource_name = :vtm_kerberos_krb5confs
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "kerberos_krb5confs"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/kerberos/krb5confs/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_kerberos_krb5confs < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_kerberos_krb5confs.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_kerberos_krb5confs,
        provider: Chef::Provider::Vtm_kerberos_krb5confs,
)

