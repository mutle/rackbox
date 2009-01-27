# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rackbox}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["remi"]
  s.date = %q{2009-01-27}
  s.description = %q{Merb-like BlackBox testing for Rack apps, including Rails}
  s.email = %q{remi@remitaylor.com}
  s.files = ["VERSION.yml", "README.markdown", "lib/rackbox.rb", "lib/rspec", "lib/rspec/custom_matcher.rb", "lib/rackbox", "lib/rackbox/rack", "lib/rackbox/rack/extensions_for_rspec.rb", "lib/rackbox/rack/sticky_sessions.rb", "lib/rackbox/rack/content_length_fix.rb", "lib/rackbox/spec", "lib/rackbox/spec/configuration.rb", "lib/rackbox/spec/helpers.rb", "lib/rackbox/rackbox.rb", "lib/rackbox/matchers.rb"]
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
    else
    end
  else
  end
end
