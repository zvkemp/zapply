class DownloadsController < ApplicationController
  before_filter :user_signed_in?

  def show
    document = document_source.find(params[:id])
    send_file document.material.path
  end

private
  def document_source
    user_is_admin? ? Document.scoped : current_user.documents 
  end

end