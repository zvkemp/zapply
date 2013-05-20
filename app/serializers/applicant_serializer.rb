class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted, :name, :current_rating_id, :application_confirmation_sent, :note, :under_consideration, :rejection_notice_sent
  embed :ids, :include => true
  # embed :ids

  has_many :documents
  has_many :ratings

  delegate :current_user, to: :scope

  def current_rating_id
    current_user.applicant_ratings.where(applicant_id: object.id).first_or_create!.id
  end
end
