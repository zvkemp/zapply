class MaterialUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{Rails.root}/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(pdf doc docx rtf)
  end
end