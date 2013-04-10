class Api::ApplicantsController < Api::AdminController

  def index
    respond_with(@applicants = User.applicants, each_serializer: ApplicantSerializer)
  end

  def show
    respond_with(@applicant = User.applicants.find(params[:id]))
  end

  def create
    @applicant = User.new(params[:applicant])
  end

end
