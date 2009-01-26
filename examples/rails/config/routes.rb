ActionController::Routing::Routes.draw do |map|

  map.print_method 'print-method',   :controller => 'welcome', :action => 'print_method'
  map.print_session 'print-session', :controller => 'welcome', :action => 'print_session'

  map.root :controller => 'welcome'

end
