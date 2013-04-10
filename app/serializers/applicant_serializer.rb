class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted
  embed :ids, :include => true
  # embed :ids

  has_many :documents
end
