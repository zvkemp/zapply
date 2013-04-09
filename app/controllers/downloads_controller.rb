class DownloadsController < ApplicationController
  before_filter :user_signed_in?

  def show
    document = current_user.documents.find(params[:id])
    send_file document.material.path
  end  
end