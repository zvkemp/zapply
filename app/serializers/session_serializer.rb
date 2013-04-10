class SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted

  def id
    1
  end
end
