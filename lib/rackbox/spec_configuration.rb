# Extend the RSpec configuration class with a use_blackbox option
#
# To add blackbox testing to a Rails app,
# in your spec_helper.rb
#
#   require 'rackbox'
#
#   Spec::Runner.configure do |config|
#     config.use_blackbox = true
#   end
#

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
            include RackBox::Matchers

            def redirect_to *args
              puts "REDIRECT TO ... the normal def ..."
            end

            # include generated url methods, eg. login_path.
            # default_url_options needs to have a host set for the Urls to work
            if defined?ActionController::UrlWriter
              include ActionController::UrlWriter
              default_url_options[:host] = 'example.com'
            end

            attr_accessor :rackbox_request
          }
        end

        before(:each, :type => :blackbox) do
          # each example should have a new request object
          @rackbox_request = Rack::MockRequest.new RackBox.app
        end

      end
    end
  end
end
