# === library: Vtm_custom

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_custom < Resource::VtmRest

    identity_attr :name
    provides :vtm_custom
    self.resource_name = :vtm_custom
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "custom"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/custom/"


    attribute :basic__string_lists, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_custom < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_custom.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__string_lists] = new_resource.basic__string_lists

    end
  end
end

Chef::Platform.set(
        resource: :vtm_custom,
        provider: Chef::Provider::Vtm_custom,
)

