actions :create
default_action :create

attribute :name, kind_of: String, name_attribute: true, required: true
attribute :id, :kind_of => String
attribute :tags, :kind_of => Array
attribute :address, :kind_of => String
attribute :port, :kind_of => Integer
