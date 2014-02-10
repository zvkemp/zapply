class Api::RatingsController < Api::AdminController

  def show
    respond_with(@rating = Rating.find(params[:id]))
  end

  def update
    @rating       = Rating.find(params[:id])
    rating_params = params[:rating]
    app_id        = rating_params.delete(:applicant_id)
    rater_name    = rating_params.delete(:rater_name)
    @rating.update_attributes(params[:rating])
    respond_with(@rating)
  end

end
