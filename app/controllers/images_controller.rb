require 'rake'
class ImagesController < DownloadsController

  def show
    document = document_source.find(params[:id])
    path     = document.material.path.pathmap("%d/%n_c.png")
    send_file "#{path}", disposition: 'inline', type: 'application/png', x_sendfile: true
  end
  
end