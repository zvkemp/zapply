class HomeController < ApplicationController

  before_filter :check_dormancy


  private

  def check_dormancy
    if current_user && current_user.dormant?
      redirect_to new_reactivation_path and return false
    end
  end
end
