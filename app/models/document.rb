class Document < ActiveRecord::Base
  attr_accessible :description
  belongs_to :user

  mount_uploader :material, MaterialUploader
  attr_accessible :material

  before_create :default_description

  def default_description
    self.description = "new file" if description.blank?
  end

  # validates_presence_of :description
end
