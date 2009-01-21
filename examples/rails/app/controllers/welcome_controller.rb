class WelcomeController < ApplicationController
  def index
    render :text => "You said #{ params[:say] || 'nothing' }"
  end
end
