class Api::SessionsController < Api::BaseController
  before_filter :user_has_not_yet_submitted, only: [:update]


  def show
    respond_with(@session = (current_user || GuestUser.new))
  end 

  def update #submitted only ( and note)
    submitted = params[:session][:submitted]
    note      = params[:session][:note]
    name      = params[:session][:name]
    @session.update_attributes(submitted: submitted, note: note, name: name)
    render :show
  end

  private

    def user_has_not_yet_submitted
      @session = current_user
      if @session.submitted?
        redirect_to root_path and return false
      end
    end
end
