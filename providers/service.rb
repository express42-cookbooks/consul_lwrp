def whyrun_supported?
  true
end

action :create do
  template "#{node['consul']['config_d_dir']}/service-#{new_resource.name}.json" do
    source "service.json.erb"
    variables resource: new_resource
    cookbook 'consul'
    notifies :reload, 'service[consul]', :delayed
  end
end
