class DocumentsController < ApplicationController

  def new
    @document = current_user.documents.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @document = current_user.documents.new(params[:document])
    if @document.save
      respond_to do |format|
        format.js
      end
    end
  end
end