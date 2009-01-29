ENV["RAILS_ENV"] = "test"

begin
  require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
rescue LoadError
  # this isn't a rails project
end

require 'spec'

if defined? RAILS_ENV
  require 'spec/rails' if defined?RAILS_ENV
end

require File.expand_path(File.dirname(__FILE__) + "/../../../lib/rackbox")

Spec::Runner.configure do |config|
  config.use_blackbox = true # more options for ... webrat, etc?
end
