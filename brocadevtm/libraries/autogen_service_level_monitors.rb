# === library: Vtm_service_level_monitors

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_service_level_monitors < Resource::VtmRest

    identity_attr :name
    provides :vtm_service_level_monitors
    self.resource_name = :vtm_service_level_monitors
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "service_level_monitors"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/service_level_monitors/"


    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__response_time, kind_of: Fixnum, default: 1000
    attribute :basic__serious_threshold, kind_of: Fixnum, default: 0
    attribute :basic__warning_threshold, kind_of: Fixnum, default: 50

  end
end

class Chef
  class Provider::Vtm_service_level_monitors < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_service_level_monitors.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__response_time] = new_resource.basic__response_time
      @configHash[:basic__serious_threshold] = new_resource.basic__serious_threshold
      @configHash[:basic__warning_threshold] = new_resource.basic__warning_threshold

    end
  end
end

Chef::Platform.set(
        resource: :vtm_service_level_monitors,
        provider: Chef::Provider::Vtm_service_level_monitors,
)

