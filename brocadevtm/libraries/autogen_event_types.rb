# === Define: Vtm_event_types

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_event_types < Resource::VtmRest

    identity_attr :name
    provides :vtm_event_types
    self.resource_name = :vtm_event_types
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "event_types"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/event_types/"


    attribute :basic__actions, kind_of: [Array, String], default: []
    attribute :basic__built_in, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__note, kind_of: String, default: ''
    attribute :cloudcredentials__event_tags, kind_of: [Array, String], default: []
    attribute :cloudcredentials__objects, kind_of: [Array, String], default: []
    attribute :config__event_tags, kind_of: [Array, String], default: []
    attribute :faulttolerance__event_tags, kind_of: [Array, String], default: []
    attribute :general__event_tags, kind_of: [Array, String], default: []
    attribute :glb__event_tags, kind_of: [Array, String], default: []
    attribute :glb__objects, kind_of: [Array, String], default: []
    attribute :java__event_tags, kind_of: [Array, String], default: []
    attribute :licensekeys__event_tags, kind_of: [Array, String], default: []
    attribute :licensekeys__objects, kind_of: [Array, String], default: []
    attribute :locations__event_tags, kind_of: [Array, String], default: []
    attribute :locations__objects, kind_of: [Array, String], default: []
    attribute :monitors__event_tags, kind_of: [Array, String], default: []
    attribute :monitors__objects, kind_of: [Array, String], default: []
    attribute :pools__event_tags, kind_of: [Array, String], default: []
    attribute :pools__objects, kind_of: [Array, String], default: []
    attribute :protection__event_tags, kind_of: [Array, String], default: []
    attribute :protection__objects, kind_of: [Array, String], default: []
    attribute :rules__event_tags, kind_of: [Array, String], default: []
    attribute :rules__objects, kind_of: [Array, String], default: []
    attribute :slm__event_tags, kind_of: [Array, String], default: []
    attribute :slm__objects, kind_of: [Array, String], default: []
    attribute :ssl__event_tags, kind_of: [Array, String], default: []
    attribute :sslhw__event_tags, kind_of: [Array, String], default: []
    attribute :trafficscript__event_tags, kind_of: [Array, String], default: []
    attribute :vservers__event_tags, kind_of: [Array, String], default: []
    attribute :vservers__objects, kind_of: [Array, String], default: []
    attribute :zxtms__event_tags, kind_of: [Array, String], default: []
    attribute :zxtms__objects, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_event_types < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_event_types.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__actions] = new_resource.basic__actions
      @configHash[:basic__built_in] = new_resource.basic__built_in
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:cloudcredentials__event_tags] = new_resource.cloudcredentials__event_tags
      @configHash[:cloudcredentials__objects] = new_resource.cloudcredentials__objects
      @configHash[:config__event_tags] = new_resource.config__event_tags
      @configHash[:faulttolerance__event_tags] = new_resource.faulttolerance__event_tags
      @configHash[:general__event_tags] = new_resource.general__event_tags
      @configHash[:glb__event_tags] = new_resource.glb__event_tags
      @configHash[:glb__objects] = new_resource.glb__objects
      @configHash[:java__event_tags] = new_resource.java__event_tags
      @configHash[:licensekeys__event_tags] = new_resource.licensekeys__event_tags
      @configHash[:licensekeys__objects] = new_resource.licensekeys__objects
      @configHash[:locations__event_tags] = new_resource.locations__event_tags
      @configHash[:locations__objects] = new_resource.locations__objects
      @configHash[:monitors__event_tags] = new_resource.monitors__event_tags
      @configHash[:monitors__objects] = new_resource.monitors__objects
      @configHash[:pools__event_tags] = new_resource.pools__event_tags
      @configHash[:pools__objects] = new_resource.pools__objects
      @configHash[:protection__event_tags] = new_resource.protection__event_tags
      @configHash[:protection__objects] = new_resource.protection__objects
      @configHash[:rules__event_tags] = new_resource.rules__event_tags
      @configHash[:rules__objects] = new_resource.rules__objects
      @configHash[:slm__event_tags] = new_resource.slm__event_tags
      @configHash[:slm__objects] = new_resource.slm__objects
      @configHash[:ssl__event_tags] = new_resource.ssl__event_tags
      @configHash[:sslhw__event_tags] = new_resource.sslhw__event_tags
      @configHash[:trafficscript__event_tags] = new_resource.trafficscript__event_tags
      @configHash[:vservers__event_tags] = new_resource.vservers__event_tags
      @configHash[:vservers__objects] = new_resource.vservers__objects
      @configHash[:zxtms__event_tags] = new_resource.zxtms__event_tags
      @configHash[:zxtms__objects] = new_resource.zxtms__objects

    end
  end
end

Chef::Platform.set(
        resource: :vtm_event_types,
        provider: Chef::Provider::Vtm_event_types,
)

