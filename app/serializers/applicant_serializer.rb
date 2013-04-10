class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted
  embed :ids, :include => true

  has_many :documents
end
