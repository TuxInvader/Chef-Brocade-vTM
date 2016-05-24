# === library: Vtm_action_programs

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_action_programs < Resource::VtmRest

    identity_attr :name
    provides :vtm_action_programs
    self.resource_name = :vtm_action_programs
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "action_programs"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/action_programs/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_action_programs < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_action_programs.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_action_programs,
        provider: Chef::Provider::Vtm_action_programs,
)

