class ApplicantsController < ApplicationController
  before_filter :authorize_admin
  layout "devise"

  def index
    @applicants = User.all
  end
end
