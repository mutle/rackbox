ActionController::Routing::Routes.draw do |map|

  map.print_method  'print-method',  :controller => 'welcome', :action => 'print_method'
  map.print_session 'print-session', :controller => 'welcome', :action => 'print_session'
  map.redirect      'redirect',      :controller => 'welcome', :action => 'redirect'

  map.root :controller => 'welcome'

end
