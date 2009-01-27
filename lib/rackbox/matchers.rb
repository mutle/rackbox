# Custom RSpec matchers
module RackBox::Matchers

  def self.included base
    puts "INCLUDED matchers INTO #{ base }"
    base.instance_eval {
      puts "inside of a base ... redirect_to? ... #{ (defined?(redirect_to)).inspect }"
    }
    #puts "base has methods ... #{ base.methods.grep(/redir/).inspect }"
  end

  #matcher(:redirect_to) do |response, url|
  #  puts "REDIRECT TO!"
  #  true
  #end

end
