class WelcomeController < ApplicationController

  def index
    render :text => "You said #{ params[:say] || 'nothing' }"
  end

  def print_method
    render :text => request.method
  end

  def print_session
    session[:session_variable] = params[:session_variable] if params[:session_variable]
    render :text => session[:session_variable].to_s
  end

end
