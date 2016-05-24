# === library: Vtm_dns_server_zone_files

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_dns_server_zone_files < Resource::VtmRest

    identity_attr :name
    provides :vtm_dns_server_zone_files
    self.resource_name = :vtm_dns_server_zone_files
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "dns_server_zone_files"
    attribute :path, kind_of: String, default: "/api/tm/3.5/config/active/dns_server/zone_files/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_dns_server_zone_files < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_dns_server_zone_files.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_dns_server_zone_files,
        provider: Chef::Provider::Vtm_dns_server_zone_files,
)

