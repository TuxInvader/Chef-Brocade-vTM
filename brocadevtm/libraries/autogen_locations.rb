# === library: Vtm_locations

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_locations < Resource::VtmRest

    identity_attr :name
    provides :vtm_locations
    self.resource_name = :vtm_locations
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "locations"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/locations/"

    attribute :basic__id, kind_of: Fixnum, required: true

    attribute :basic__latitude, kind_of: Float, default: 0.0
    attribute :basic__longitude, kind_of: Float, default: 0.0
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__type, kind_of: String, default: 'config'

  end
end

class Chef
  class Provider::Vtm_locations < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_locations.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__latitude] = new_resource.basic__latitude
      @configHash[:basic__longitude] = new_resource.basic__longitude
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__type] = new_resource.basic__type

    end
  end
end

Chef::Platform.set(
        resource: :vtm_locations,
        provider: Chef::Provider::Vtm_locations,
)

