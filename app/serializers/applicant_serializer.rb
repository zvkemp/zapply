class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted, :document_ids
end
