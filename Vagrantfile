VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/zzlamp.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ZzLamp.configure(config, YAML::load(File.read(path + '/zzlamp.yaml')))
end