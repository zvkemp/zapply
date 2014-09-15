class ReactivationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    if !current_user.dormant?
      redirect_to root_path
    else
      flash[:notice] = "Your account is dormant. To reactivate and reapply for the Office Manager position, please click the button below. You will have the opportunity to revise your application prior to resubmitting."
    end
  end

  def create
    if current_user.update_attributes(:dormant => false, submitted: false)
      flash[:notice] = "Your account has been reactivated. Please review and update your application and re-submit when ready."
      redirect_to root_path
    end
  end
end
