# === library: Vtm_ssl_cas

require_relative 'vtmrest'

class Chef
  class Resource::Vtm_ssl_cas < Resource::VtmRest

    identity_attr :name
    provides :vtm_ssl_cas
    self.resource_name = :vtm_ssl_cas
    actions :create, :destroy
    default_action :create
    
    attribute :name, kind_of: String, name_attribute: true
    attribute :internal, kind_of: String, default: "ssl_cas"
    attribute :path, kind_of: String, default: "/api/tm/3.8/config/active/ssl/cas/"


    attribute :content, kind_of: String, default: ''

  end
end

class Chef
  class Provider::Vtm_ssl_cas < Provider::VtmRest
    def load_current_resource
      @current_resource ||= Resource::Vtm_ssl_cas.new(new_resource.name)
      super

      @configHash = {}
      @configHash[:content] = new_resource.content

    end
  end
end

Chef::Platform.set(
        resource: :vtm_ssl_cas,
        provider: Chef::Provider::Vtm_ssl_cas,
)

