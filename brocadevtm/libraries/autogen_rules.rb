# === library: Vtm_rules

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_rules < Resource::VtmRest

    identity_attr :name
    provides :vtm_rules
    self.resource_name = :vtm_rules
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "rules"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/rules/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_rules < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_rules.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_rules,
        provider: Chef::Provider::Vtm_rules,
)

