
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

  # i am an rdoc comment on RackBox's eigenclass
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
        if File.file? 'config.ru'
          @app = Rack::Builder.new { eval(File.read('config.ru')) }
        elsif defined?RAILS_ENV and defined?RAILS_ROOT
          raise "You need the Rack::Adapter::Rails to run Rails apps with RackBox." + 
                " Try: sudo gem install thin" unless defined?Rack::Adapter::Rails
          @app = Rack::Adapter::Rails.new :root => RAILS_ROOT, :environment => RAILS_ENV
        else
          raise "RackBox.app not configured."
        end
      end
      @app
    end

    # helper method for taking a Hash of params and turning them into POST params
    #
    # >> RackBox.build_query :hello => 'there'
    # => 'hello=there'
    #
    # >> RackBox.build_query :hello => 'there', :foo => 'bar'
    # => 'hello=there&foo=bar' 
    #
    # >> RackBox.build_query :user => { :name => 'bob', :password => 'secret' }
    # => 'user[name]=bob&user[password]=secret' 
    #
    def build_query params_hash = { }
      # check to make sure no values are Hashes ...
      # if they are, we need to flatten them!
      params_hash.each do |key, value|
        # params_hash  :a => { :b => X, :c => Y }
        # needs to be  'a[b]' => X, 'a[b]' => Y
        if value.is_a? Hash
          inner_hash = params_hash.delete key # { :b => X, :c => Y }
          inner_hash.each do |subkey, subvalue|
            new_key = "#{ key }[#{ subkey }]" # a[b] or a[c]
            puts "warning: overwriting query parameter #{ new_key }" if params_hash[new_key]
            params_hash[new_key] = subvalue # 'a[b]' => X or a[c] => Y
          end
          # we really shouldn't keep going thru the #each now that we've altered data!
          return build_query(params_hash)
        end
      end
      Rack::Utils.build_query params_hash
    end

  end
end
