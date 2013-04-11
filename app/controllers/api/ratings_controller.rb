class Api::RatingsController < Api::AdminController

  def show
    # TODO: be careful with this - using non-standard id lookup.
    # The rating id WILL NOT MATCH the params[:id].
    respond_with(@rating = current_user.applicant_ratings.where(applicant_id: params[:id]).first_or_create!)
  end

  def update
    @rating = current_user.applicant_ratings.where(applicant_id: params[:id]).first
    rating_params = params[:rating]
    app_id = rating_params.delete(:id){ nil }
    @rating.update_attributes(rating_params)
    respond_with(@rating)
  end

end

