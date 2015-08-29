def whyrun_supported?
  true
end

action :create do

  case new_resource.type
  when 'event'
    t = template "#{node['consul']['config_d_dir']}/#{new_resource.event_name}.json" do
      source "watch.json.erb"
      variables resource: new_resource
      cookbook 'consul'
      notifies :reload, 'service[consul]', :delayed
    end

    t.run_action(:create)
    new_resource.updated_by_last_action(true) if t.updated_by_last_action?

  end
end
