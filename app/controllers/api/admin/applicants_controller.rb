class Api::Admin::ApplicantsController < Api::Admin::BaseController

  def index
    respond_with(@applicants = User.applicants)
  end

  def show
    respond_with(@applicant = User.applicants.find(params[:id]))
  end

  def create
    @applicant = User.new(params[:applicant])
  end

end
