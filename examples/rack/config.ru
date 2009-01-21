run lambda { |env|
  params = Rack::Request.new(env).params
  [ 200, {}, "You said #{ params['say'] || 'nothing' }" ]
}
