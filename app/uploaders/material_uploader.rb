class MaterialUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{Rails.root}/application_material/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end