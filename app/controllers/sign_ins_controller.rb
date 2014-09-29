class SignInsController < ApplicationController
  before_filter :authorize_admin

  def create
    sign_in User.find(params[:applicant_id]) and redirect_to root_path
  end
end
