# === library: Vtm_user_groups

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_user_groups < Resource::VtmRest

    identity_attr :name
    provides :vtm_user_groups
    self.resource_name = :vtm_user_groups
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "user_groups"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/user_groups/"


    attribute :basic__description, kind_of: String, default: ''
    attribute :basic__password_expire_time, kind_of: Fixnum, default: 0
    attribute :basic__permissions, kind_of: [Array, String], default: []
    attribute :basic__timeout, kind_of: Fixnum, default: 30

  end
end

class Chef
  class Provider::Vtm_user_groups < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_user_groups.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__description] = new_resource.basic__description
      @configHash[:basic__password_expire_time] = new_resource.basic__password_expire_time
      @configHash[:basic__permissions] = new_resource.basic__permissions
      @configHash[:basic__timeout] = new_resource.basic__timeout

    end
  end
end

Chef::Platform.set(
        resource: :vtm_user_groups,
        provider: Chef::Provider::Vtm_user_groups,
)

