# === library: Vtm_monitor_scripts

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_monitor_scripts < Resource::VtmRest

    identity_attr :name
    provides :vtm_monitor_scripts
    self.resource_name = :vtm_monitor_scripts
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "monitor_scripts"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/monitor_scripts/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_monitor_scripts < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_monitor_scripts.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_monitor_scripts,
        provider: Chef::Provider::Vtm_monitor_scripts,
)

