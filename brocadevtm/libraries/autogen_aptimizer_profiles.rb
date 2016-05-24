# === library: Vtm_aptimizer_profiles

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_aptimizer_profiles < Resource::VtmRest

    identity_attr :name
    provides :vtm_aptimizer_profiles
    self.resource_name = :vtm_aptimizer_profiles
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "aptimizer_profiles"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/aptimizer/profiles/"


    attribute :basic__background_after, kind_of: Fixnum, default: 0
    attribute :basic__background_on_additional_resources, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__mode, kind_of: String, default: 'active'
    attribute :basic__show_info_bar, kind_of: [TrueClass, FalseClass], default: false

  end
end

class Chef
  class Provider::Vtm_aptimizer_profiles < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_aptimizer_profiles.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__background_after] = new_resource.basic__background_after
      @configHash[:basic__background_on_additional_resources] = new_resource.basic__background_on_additional_resources
      @configHash[:basic__mode] = new_resource.basic__mode
      @configHash[:basic__show_info_bar] = new_resource.basic__show_info_bar

    end
  end
end

Chef::Platform.set(
        resource: :vtm_aptimizer_profiles,
        provider: Chef::Provider::Vtm_aptimizer_profiles,
)

