class Api::JobOpeningsController < Api::BaseController
  def show
    respond_with(@job_opening = JobOpening.current, serializer: JobOpeningSerializer)
  end
end
