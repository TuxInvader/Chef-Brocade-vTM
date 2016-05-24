# === library: Vtm_persistence

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_persistence < Resource::VtmRest

    identity_attr :name
    provides :vtm_persistence
    self.resource_name = :vtm_persistence
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "persistence"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/persistence/"


    attribute :basic__cookie, kind_of: String, default: ''
    attribute :basic__delete, kind_of: [TrueClass, FalseClass], default: true
    attribute :basic__failure_mode, kind_of: String, default: 'new_node'
    attribute :basic__note, kind_of: String, default: ''
    attribute :basic__type, kind_of: String, default: 'ip'
    attribute :basic__url, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_persistence < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_persistence.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__cookie] = new_resource.basic__cookie
      @configHash[:basic__delete] = new_resource.basic__delete
      @configHash[:basic__failure_mode] = new_resource.basic__failure_mode
      @configHash[:basic__note] = new_resource.basic__note
      @configHash[:basic__type] = new_resource.basic__type
      @configHash[:basic__url] = new_resource.basic__url

    end
  end
end

Chef::Platform.set(
        resource: :vtm_persistence,
        provider: Chef::Provider::Vtm_persistence,
)

