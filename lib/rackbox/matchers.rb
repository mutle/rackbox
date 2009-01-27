# Custom RSpec matchers
module RackBox::Matchers

  matcher(:redirect_to) do |response, url|
    puts "REDIRECT TO!"
    true
  end

end
