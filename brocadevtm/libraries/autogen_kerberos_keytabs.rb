# === library: Vtm_kerberos_keytabs

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_kerberos_keytabs < Resource::VtmRest

    identity_attr :name
    provides :vtm_kerberos_keytabs
    self.resource_name = :vtm_kerberos_keytabs
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "kerberos_keytabs"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/kerberos/keytabs/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_kerberos_keytabs < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_kerberos_keytabs.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_kerberos_keytabs,
        provider: Chef::Provider::Vtm_kerberos_keytabs,
)

