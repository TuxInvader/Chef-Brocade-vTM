# === library: Vtm_bandwidth

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_bandwidth < Resource::VtmRest

    identity_attr :name
    provides :vtm_bandwidth
    self.resource_name = :vtm_bandwidth
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "bandwidth"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/bandwidth/"


    attribute :basic__maximum, kind_of: Fixnum, default: 10000
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__sharing, kind_of: String, default: 'cluster'

  end
end

class Chef
  class Provider::Vtm_bandwidth < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_bandwidth.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__maximum] = new_resource.basic__maximum
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__sharing] = new_resource.basic__sharing

    end
  end
end

Chef::Platform.set(
        resource: :vtm_bandwidth,
        provider: Chef::Provider::Vtm_bandwidth,
)

