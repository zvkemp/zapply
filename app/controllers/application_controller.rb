class ApplicationController < ActionController::Base
  protect_from_forgery
  serialization_scope :view_context

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

  def application_period_is_open?
    true
  end

  def application_period_is_closed?
    !application_period_is_open?
  end


end
