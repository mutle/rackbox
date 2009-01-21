require 'spec'
require File.expand_path(File.dirname(__FILE__) + "/../../../lib/rackbox")

Spec::Runner.configure do |config|
  config.use_blackbox = true
end
