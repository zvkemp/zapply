class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @session = current_user || GuestUser.new
  end
end
