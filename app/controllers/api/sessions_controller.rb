class Api::SessionsController < Api::BaseController
  def show
    respond_with(@user = (current_user || GuestUser.new))
  end 
end
