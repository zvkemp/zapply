class Api::SessionsController < Api::BaseController
  def show
    respond_with(@session = (current_user || GuestUser.new))
  end 

  def update #submitted only
    puts params.inspect
    @session     = current_user
    submitted = params[:session][:submitted]
    @session.update_attributes(submitted: submitted) if submitted 
    # respond_with(@session)
    render :show
  end
end
