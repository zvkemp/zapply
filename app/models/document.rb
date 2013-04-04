class Document < ActiveRecord::Base
  attr_accessible :description
  belongs_to :user

  mount_uploader :material, MaterialUploader
  attr_accessible :material
end
