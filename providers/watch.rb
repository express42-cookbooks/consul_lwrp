def whyrun_supported?
  true
end

action :create do

  case new_resource.type
  when 'event'
    resource_json = {
      type: new_resource.type,
      name: new_resource.event_name,
      handler: new_resource.handler,
      passingonly: new_resource.passingonly
    }

    resource_json[:tag] = new_resource.tag if new_resource.tag

    resource_name = "watch-event-#{new_resource.event_name}"
  when 'service'
    resource_json = {
      type: new_resource.type,
      service: new_resource.service,
      handler: new_resource.handler
    }
    resource_name = "watch-service-#{new_resource.service}"
  else
    raise "Consul watch type #{new_resource.type} not exists or not supported by cookbook"
  end

  template "#{node['consul']['config_d_dir']}/#{resource_name}.json" do
    source "watch.json.erb"
    variables resource: resource_json
    cookbook 'consul'
    notifies :reload, 'service[consul]', :delayed
  end
end
