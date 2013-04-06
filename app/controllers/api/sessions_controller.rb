class Api::SessionsController < Api::BaseController
  def show
    respond_with(@session = (current_user || GuestUser.new))
  end 
end
