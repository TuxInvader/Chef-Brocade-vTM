# === library: Vtm_application_firewall

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_application_firewall < Resource::VtmRest

    identity_attr :name
    provides :vtm_application_firewall
    self.resource_name = :vtm_application_firewall
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "application_firewall"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/application_firewall"



  end
end

class Chef
  class Provider::Vtm_application_firewall < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_application_firewall.new(new_resource.name)
      super

      @configHash = {}

    end
  end
end

Chef::Platform.set(
        resource: :vtm_application_firewall,
        provider: Chef::Provider::Vtm_application_firewall,
)

