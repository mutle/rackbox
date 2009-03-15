# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rackbox}
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["remi"]
  s.date = %q{2009-03-14}
  s.default_executable = %q{rackbox}
  s.description = %q{Merb-like BlackBox testing for Rack apps, including Rails}
  s.email = %q{remi@remitaylor.com}
  s.executables = ["rackbox"]
  s.files = ["Rakefile", "VERSION.yml", "README.markdown", "LICENSE", "RDOC_README.rdoc", "bin/rackbox", "lib/rackbox.rb", "lib/rspec", "lib/rspec/custom_matcher.rb", "lib/rackbox", "lib/rackbox/rack", "lib/rackbox/rack/extensions_for_rspec.rb", "lib/rackbox/rack/sticky_sessions.rb", "lib/rackbox/rack/content_length_fix.rb", "lib/rackbox/spec.rb", "lib/rackbox/bin.rb", "lib/rackbox/spec", "lib/rackbox/spec/configuration.rb", "lib/rackbox/spec/helpers.rb", "lib/rackbox/bacon.rb", "lib/rackbox/app.rb", "lib/rackbox/test.rb", "lib/rackbox/rackbox.rb", "lib/rackbox/matchers.rb", "spec/request_method_spec.rb", "spec/posting_data_spec.rb", "spec/rackbox_build_query_spec.rb", "spec/custom_request_header_specs.rb", "spec/spec_helper.rb", "examples/sinatra", "examples/sinatra/run-specs", "examples/sinatra/spec", "examples/sinatra/config.ru", "examples/sinatra/sinatra_app.rb", "examples/rack", "examples/rack/run-specs", "examples/rack/spec", "examples/rack/config.ru", "examples/rails", "examples/rails/Rakefile", "examples/rails/script", "examples/rails/script/dbconsole", "examples/rails/script/autospec", "examples/rails/script/spec_server", "examples/rails/script/destroy", "examples/rails/script/spec", "examples/rails/script/plugin", "examples/rails/script/console", "examples/rails/script/server", "examples/rails/script/runner", "examples/rails/script/performance", "examples/rails/script/performance/request", "examples/rails/script/performance/profiler", "examples/rails/script/performance/benchmarker", "examples/rails/script/generate", "examples/rails/script/about", "examples/rails/script/process", "examples/rails/script/process/inspector", "examples/rails/script/process/reaper", "examples/rails/script/process/spawner", "examples/rails/test", "examples/rails/test/test_helper.rb", "examples/rails/test/functional", "examples/rails/test/functional/welcome_controller_test.rb", "examples/rails/test/performance", "examples/rails/test/performance/browsing_test.rb", "examples/rails/run-specs", "examples/rails/lib", "examples/rails/lib/tasks", "examples/rails/lib/tasks/rspec.rake", "examples/rails/spec", "examples/rails/config", "examples/rails/config/routes.rb", "examples/rails/config/initializers", "examples/rails/config/initializers/mime_types.rb", "examples/rails/config/initializers/inflections.rb", "examples/rails/config/initializers/new_rails_defaults.rb", "examples/rails/config/locales", "examples/rails/config/locales/en.yml", "examples/rails/config/database.yml", "examples/rails/config/environment.rb", "examples/rails/config/boot.rb", "examples/rails/config/environments", "examples/rails/config/environments/production.rb", "examples/rails/config/environments/test.rb", "examples/rails/config/environments/development.rb", "examples/rails/public", "examples/rails/public/dispatch.cgi", "examples/rails/public/images", "examples/rails/public/images/rails.png", "examples/rails/public/500.html", "examples/rails/public/422.html", "examples/rails/public/dispatch.fcgi", "examples/rails/public/robots.txt", "examples/rails/public/favicon.ico", "examples/rails/public/javascripts", "examples/rails/public/javascripts/application.js", "examples/rails/public/javascripts/prototype.js", "examples/rails/public/javascripts/controls.js", "examples/rails/public/javascripts/effects.js", "examples/rails/public/javascripts/dragdrop.js", "examples/rails/public/404.html", "examples/rails/public/dispatch.rb", "examples/rails/app", "examples/rails/app/controllers", "examples/rails/app/controllers/welcome_controller.rb", "examples/rails/app/controllers/application.rb", "examples/rails/app/views", "examples/rails/app/views/layouts", "examples/rails/app/views/layouts/application.html.erb", "examples/rails/app/views/welcome", "examples/rails/app/views/welcome/some_html.html.erb", "examples/rails/app/helpers", "examples/rails/app/helpers/application_helper.rb", "examples/rails/app/helpers/welcome_helper.rb", "examples/rails/db", "examples/rails/db/test.sqlite3", "examples/rails/db/development.sqlite3", "examples/rails/db/schema.rb", "examples/rails/README", "examples/rails/doc", "examples/rails/doc/README_FOR_APP", "examples/rails/log", "examples/rails/log/test.log", "examples/rails/log/development.log", "rails_generators/blackbox_spec", "rails_generators/blackbox_spec/blackbox_spec_generator.rb", "rails_generators/blackbox_spec/USAGE", "rails_generators/blackbox_spec/templates", "rails_generators/blackbox_spec/templates/spec.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/remi/rackbox}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb-like BlackBox testing for Rack apps, including Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<remi-rails-rack-adapter>, [">= 0"])
      s.add_runtime_dependency(%q<remi-simplecli>, [">= 0"])
    else
      s.add_dependency(%q<remi-rails-rack-adapter>, [">= 0"])
      s.add_dependency(%q<remi-simplecli>, [">= 0"])
    end
  else
    s.add_dependency(%q<remi-rails-rack-adapter>, [">= 0"])
    s.add_dependency(%q<remi-simplecli>, [">= 0"])
  end
end
