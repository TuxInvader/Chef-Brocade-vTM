# === library: Vtm_rate

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_rate < Resource::VtmRest

    identity_attr :name
    provides :vtm_rate
    self.resource_name = :vtm_rate
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "rate"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/rate/"


    attribute :basic__max_rate_per_minute, kind_of: Fixnum, default: 0
    attribute :basic__max_rate_per_second, kind_of: Fixnum, default: 0
    attribute :basic__note, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_rate < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_rate.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__max_rate_per_minute] = new_resource.basic__max_rate_per_minute
      @configHash[:basic__max_rate_per_second] = new_resource.basic__max_rate_per_second
      @configHash[:basic__note] = new_resource.basic__note

    end
  end
end

Chef::Platform.set(
        resource: :vtm_rate,
        provider: Chef::Provider::Vtm_rate,
)

