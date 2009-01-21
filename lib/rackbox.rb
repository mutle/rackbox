$:.unshift File.dirname(__FILE__)
%w( rubygems thin rackbox/rack_content_length_fix ).each {|lib| require lib }

# To add blackbox testing to a Rails app,
# in your spec_helper.rb
#
#   require 'rackbox'
#
#   Spec::Runner.configure do |config|
#     config.use_blackbox = true
#   end
#
class RackBox
  class << self
    # the Rack appliction to do 'Black Box' testing against
    #
    # To set, in your spec_helper.rb or someplace:
    #   RackBox.app = Rack::Adapter::Rails.new :root => '/root/directory/of/rails/app', :environment => 'test'
    #
    # If not explicitly set, uses RAILS_ROOT (if defined?) and RAILS_ENV (if defined?)
    attr_accessor :app

    def app
      unless @app and @app.respond_to?:call
        if defined?RAILS_ENV and defined?RAILS_ROOT
          @app = Rack::Adapter::Rails.new :root => RAILS_ROOT, :environment => RAILS_ENV
        else
          raise "RackBox.app not configured.  To configure implicitly, make sure RAILS_ROOT and RAILS_ENV are set."
        end
      end
      @app
    end
  end
end

module RackBox::SpecHelpers
  # A port of Merb's request() method, used in tests
  #
  # At the moment, we're using #req instead because #request conflicts 
  # with an existing RSpec-Rails method
  #
  # Usage:
  #   
  #   req '/'
  #   req login_path
  #   req url_for(:controller => 'login')
  #
  #   req '/', :method => :post, :params => { 'chunky' => 'bacon' }
  #
  # TODO support inner hashes, so { :foo => { :chunky => :bacon } } becomes 'foo[chunky]=bacon'
  #
  # TODO take any additional options and pass them along to the environment, so we can say 
  #      req '/', :user_agent => 'some custom user agent'
  #
  def req url, options = {}
    options[:method] ||= :get
    options[:params] ||= { }
    Rack::MockRequest.new(RackBox.app).send options[:method], url, :input => Rack::Utils.build_query(options[:params])
  end
end

spec_configuration_class = nil
spec_configuration_class = Spec::Example::Configuration if defined? Spec::Example::Configuration
spec_configuration_class = Spec::Runner::Configuration if defined? Spec::Runner::Configuration

if spec_configuration_class
  spec_configuration_class.class_eval do
    # Adds blackbox testing to your Rails application using RackBox.
    #
    # To use, put your 'blackbox' specs into the spec/blackbox
    # directory, eg. spec/blackbox/login_spec.rb
    #
    # In these specs, the RackBox::SpecHelpers#req method will be available to you
    #
    def use_blackbox= bool
      if bool == true
        before(:all, :type => :blackbox) do
          self.class.instance_eval {
            # include our own helpers, eg. RackBox::SpecHelpers#req
            include RackBox::SpecHelpers

            # include generated url methods, eg. login_path.
            # default_url_options needs to have a host set for the Urls to work
            include ActionController::UrlWriter
            default_url_options[:host] = 'example.com'
          }
        end
      end
    end
  end
end
