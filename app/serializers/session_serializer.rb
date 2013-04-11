class SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :submitted, :admin, :signed_in, :note

  def id
    1
  end

  def signed_in
    object.is_a? User
  end
end


# Zapply.Session = DS.Model.extend
#   name: DS.attr('string')
#   signed_in: DS.attr('boolean')
#   admin: DS.attr('boolean')
#   note: DS.attr('string')