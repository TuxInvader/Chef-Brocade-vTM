# === Define: Vtm_glb_services

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_glb_services < Resource::VtmRest

    identity_attr :name
    provides :vtm_glb_services
    self.resource_name = :vtm_glb_services
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
	 attribute :internal, kind_of: String, default: "glb_services"
    attribute :path, kind_of: String, default: "/api/tm/3.3/config/active/glb_services/"


    attribute :basic__algorithm, kind_of: String, default: 'hybrid'
    attribute :basic__all_monitors_needed, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__autorecovery, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__chained_auto_failback, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__chained_location_order, kind_of: [Array, String], default: []
    attribute :basic__disable_on_failure, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__dnssec_keys, kind_of: [Array, String], default: []
    attribute :basic__domains, kind_of: [Array, String], default: []
    attribute :basic__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :basic__geo_effect, kind_of: Fixnum, default: 50
    attribute :basic__last_resort_response, kind_of: [Array, String], default: []
    attribute :basic__location_draining, kind_of: [Array, String], default: []
    attribute :basic__location_settings, kind_of: [Array, String], default: []
    attribute :basic__return_ips_on_fail, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__rules, kind_of: [Array, String], default: []
    attribute :basic__ttl, kind_of: Fixnum, default: -1
    attribute :log__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :log__filename, kind_of: String, default: '%zeushome%/zxtm/log/services/%g.log'
    attribute :log__format, kind_of: String, default: '%t, %s, %l, %q, %g, %n, %d, %a'

  end
end

class Chef
  class Provider::Vtm_glb_services < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_glb_services.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__algorithm] = new_resource.basic__algorithm
      @configHash[:basic__all_monitors_needed] = new_resource.basic__all_monitors_needed
      @configHash[:basic__autorecovery] = new_resource.basic__autorecovery
      @configHash[:basic__chained_auto_failback] = new_resource.basic__chained_auto_failback
      @configHash[:basic__chained_location_order] = new_resource.basic__chained_location_order
      @configHash[:basic__disable_on_failure] = new_resource.basic__disable_on_failure
      @configHash[:basic__dnssec_keys] = new_resource.basic__dnssec_keys
      @configHash[:basic__domains] = new_resource.basic__domains
      @configHash[:basic__enabled] = new_resource.basic__enabled
      @configHash[:basic__geo_effect] = new_resource.basic__geo_effect
      @configHash[:basic__last_resort_response] = new_resource.basic__last_resort_response
      @configHash[:basic__location_draining] = new_resource.basic__location_draining
      @configHash[:basic__location_settings] = new_resource.basic__location_settings
      @configHash[:basic__return_ips_on_fail] = new_resource.basic__return_ips_on_fail
      @configHash[:basic__rules] = new_resource.basic__rules
      @configHash[:basic__ttl] = new_resource.basic__ttl
      @configHash[:log__enabled] = new_resource.log__enabled
      @configHash[:log__filename] = new_resource.log__filename
      @configHash[:log__format] = new_resource.log__format

    end
  end
end

Chef::Platform.set(
        resource: :vtm_glb_services,
        provider: Chef::Provider::Vtm_glb_services,
)

