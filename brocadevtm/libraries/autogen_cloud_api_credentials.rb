# === library: Vtm_cloud_api_credentials

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_cloud_api_credentials < Resource::VtmRest

    identity_attr :name
    provides :vtm_cloud_api_credentials
    self.resource_name = :vtm_cloud_api_credentials
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "cloud_api_credentials"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/cloud_api_credentials/"


    attribute :basic__api_server, kind_of: String, default: ''
    attribute :basic__cloud_api_timeout, kind_of: Fixnum, default: 200
    attribute :basic__cred1, kind_of: String, default: ''
    attribute :basic__cred2, kind_of: String, default: ''
    attribute :basic__cred3, kind_of: String, default: ''
    attribute :basic__script, kind_of: String, default: ''
    attribute :basic__update_interval, kind_of: Fixnum, default: 30

  end
end

class Chef
  class Provider::Vtm_cloud_api_credentials < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_cloud_api_credentials.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:basic__api_server] = new_resource.basic__api_server
      @configHash[:basic__cloud_api_timeout] = new_resource.basic__cloud_api_timeout
      @configHash[:basic__cred1] = new_resource.basic__cred1
      @configHash[:basic__cred2] = new_resource.basic__cred2
      @configHash[:basic__cred3] = new_resource.basic__cred3
      @configHash[:basic__script] = new_resource.basic__script
      @configHash[:basic__update_interval] = new_resource.basic__update_interval

    end
  end
end

Chef::Platform.set(
        resource: :vtm_cloud_api_credentials,
        provider: Chef::Provider::Vtm_cloud_api_credentials,
)

