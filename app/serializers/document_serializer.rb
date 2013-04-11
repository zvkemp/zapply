class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :description, :material, :download_href, :image_href

  def material
    object.material_identifier
  end

  def download_href
    download_path(object)
  end

  def image_href
    image_path(object)
  end


end
