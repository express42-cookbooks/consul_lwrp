actions :create
default_action :create

attribute :type, kind_of: String, name_attribute: true, required: true,
  equal_to: ['event', 'service']
attribute :handler, :kind_of => String, :required => true
attribute :event_name, :kind_of => String
attribute :service, :kind_of => String
