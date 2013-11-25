class Api::JobOpeningsController < Api::BaseController
  def show
    respond_with(@job_opening = JobOpening.last, serializer: JobOpeningSerializer)
  end
end
