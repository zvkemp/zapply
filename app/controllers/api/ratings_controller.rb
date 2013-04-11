# class Api::RatingsController < Api::AdminController

#   def show
#     # TODO: be careful with this - using non-standard id lookup.
#     # The rating id WILL NOT MATCH the params[:id].
#     respond_with(@rating = current_user.applicant_ratings.where(applicant_id: params[:id]).first_or_create!)
#   end

#   def update
#     # TODO: FIX THIS TRASH  
#     @rating = current_user.applicant_ratings.where(applicant_id: params[:id]).first
#     rating_params = params[:rating]
#     app_id = rating_params.delete(:id){ nil }
#     @rating.update_attributes(rating_params)
#     respond_with(@rating)
#   end

# end



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