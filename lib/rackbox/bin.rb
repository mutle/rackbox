require 'optparse'
require 'simplecli'

class String
  def indent number_of_spaces = 1
    self.gsub(/^(.*)$/, (' ' * number_of_spaces) + '\1')
  end
end

class RackBox::Bin
  include SimpleCLI

  def initialize *args
    @default_command = :request
    super
  end

  def usage *args
    puts <<doco

  rackbox == %{ For hitting your Rack applications }

    Usage:
      rackbox command [options]

    Examples:
      rackbox info               # prints app info
      rackbox commands           # list commands
      rackbox get /              # request / path
      rackbox post -d '<XML>' /  # POST data to / path
      rackbox /                  # GET / 
      rackbox --data '<XML>'     # POST data to / path
      rackbox /dogs --xml        # get /dogs, accepting xml

    Further help:
      rackbox commands         # list all available commands
      rackbox help <COMMAND>   # show help for COMMAND
      rackbox help             # show this help message

doco
  end 

  %w( get post put delete ).each do |http_method|
    define_method(http_method) do |*args|
      request *( ['-m', http_method] + args )
    end
    define_method("#{http_method}_help") do
      <<doco
  Usage: #{ script_name } #{ http_method } '/some/path'

    Summary:
      Run a #{ http_method.upcase } request against a Rack app
    end
doco
    end
  end

  def request_help
    <<doco
Usage: #{ script_name } request '/some/path'

  Options:
    -m, --method      The HTTP method to use, default: get
    -d, --data        Data to that you can PUT/POST, eg. -d '<XML>'
    -s, --show        What to show, eg. -s body,headers,status or
                      call multiple times, eg. -s body -s headers
    -h, --header      Add header to request, eg. -h accept=text/plain
    -j, --json        Sets 'Accept' header to 'application/json'
    -x, --xml         Sets 'Accept' header to 'application/xml'

  Summary:
    Run a request against a Rack app
  end
doco
  end
  def request *args
    options = {
      :show => [],
      :headers => {}
    }
    opts = OptionParser.new do |opts|
      opts.on('-j', '--json'){ options[:headers]['Accept'] = 'application/json' }
      opts.on('-x', '--xml'){ options[:headers]['Accept'] = 'application/xml' }
      opts.on('-m','--method [m]'){|m| options[:method] = m }
      opts.on('-d','--data [d]'){|d| options[:data] = d }
      opts.on('-s','--show [s]'){|s| options[:show] += s.split(',') }
      opts.on('-h','--header [h]'){|h|
        name,value = h.split('=')
        options[:headers][name] = value
      }
    end 
    opts.parse! args

    rackbox_options = { }
    rackbox_options[:method] = options[:method] if options[:method]
    rackbox_options[:data]   = options[:data] if options[:data]

    options[:headers].each do |name, value|
      rackbox_options[name] = value
    end

    url = args.pop
    response = RackBox.request url, rackbox_options
    options[:show] = %w( body headers status ) if options[:show].empty?

    if options[:show].include? 'body'
      body_text = ''
      response.body.each {|str| body_text << str }
    end

    output = "Response:\n"
    output << "  Status: #{ response.status }\n" if options[:show].include? 'status'
    output << "  Headers: \n#{ response.headers.to_yaml.strip.indent(4) }\n" if options[:show].include? 'headers'
    output << "  Body: \n#{ body_text.indent(4) }\n" if options[:show].include? 'body'

    puts output
  end

  def info_help
    <<doco
Usage: #{ script_name } info

  Summary:
    Display information about the current Rack application
  end
doco
  end
  def info
    puts "RackBox.app => #{ RackBox.app.inspect }"
  end

end
