class Api::DocumentsController < Api::BaseController
  def index
    @documents = (current_user || GuestUser.new).documents
    respond_with @documents
  end

  def show
    @document = current_user.documents.find(params[:id])
    respond_with @document
  end

  def create
    @document = current_user.documents.new(params[:document])
    if @document.save
      render :show
    else
      respond_with(:api, @document)
    end
  end

  def update
  end

  def destroy
    @document = current_user.documents.find(params[:id])
    @document.destroy
    respond_with(:api, @document)
  end
end
