class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @session = current_user || GuestUser.new
    puts @session.inspect
  end
end
