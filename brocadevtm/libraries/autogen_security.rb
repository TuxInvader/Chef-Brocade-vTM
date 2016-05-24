# === library: Vtm_security

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_security < Resource::VtmRest

    identity_attr :name
    provides :vtm_security
    self.resource_name = :vtm_security
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "security"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/security"


    attribute :basic__access, kind_of: [Array, String], default: []
    attribute :ssh_intrusion__bantime, kind_of: Fixnum, default: 600
    attribute :ssh_intrusion__blacklist, kind_of: [Array, String], default: []
    attribute :ssh_intrusion__enabled, kind_of: [TrueClass, FalseClass], default: false
    attribute :ssh_intrusion__findtime, kind_of: Fixnum, default: 600
    attribute :ssh_intrusion__maxretry, kind_of: Fixnum, default: 6
    attribute :ssh_intrusion__whitelist, kind_of: [Array, String], default: []

  end
end

class Chef
  class Provider::Vtm_security < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_security.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__access] = new_resource.basic__access
      @configHash[:ssh_intrusion__bantime] = new_resource.ssh_intrusion__bantime
      @configHash[:ssh_intrusion__blacklist] = new_resource.ssh_intrusion__blacklist
      @configHash[:ssh_intrusion__enabled] = new_resource.ssh_intrusion__enabled
      @configHash[:ssh_intrusion__findtime] = new_resource.ssh_intrusion__findtime
      @configHash[:ssh_intrusion__maxretry] = new_resource.ssh_intrusion__maxretry
      @configHash[:ssh_intrusion__whitelist] = new_resource.ssh_intrusion__whitelist

    end
  end
end

Chef::Platform.set(
        resource: :vtm_security,
        provider: Chef::Provider::Vtm_security,
)

