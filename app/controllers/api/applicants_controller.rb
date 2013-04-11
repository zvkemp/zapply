class Api::ApplicantsController < Api::AdminController

  def index
    respond_with(@applicants = User.applicants.submitted.includes(:documents), each_serializer: ApplicantSerializer)
  end

  def show
    respond_with(@applicant = User.applicants.find(params[:id], :include => :documents), serializer: ApplicantSerializer)
  end

  def update
    puts params.inspect
    params[:applicant].delete(:current_rating_id)
    @applicant = User.find(params[:id])
    @applicant.update_attributes(params[:applicant])
    respond_with(@applicant)
  end

  def create
    @applicant = User.new(params[:applicant])
  end

end
