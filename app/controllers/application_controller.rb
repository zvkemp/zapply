class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @session = current_user || GuestUser.new
  end

protected

  def authorize_admin
    unless current_user.is_a?(User) && current_user.admin?
      redirect_to root_path and return false
    end
  end

private

  def user_is_admin?
    current_user.admin?
  end


end
