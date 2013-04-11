class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :description, :material, :download_href

  def material
    object.material_identifier
  end

  def download_href
    download_path(object)
  end


end
