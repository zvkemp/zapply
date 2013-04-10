class GuestUser
  include ActiveModel::Serialization
  
  def id
    0
  end

  def email
    ""  
  end

  def submitted
    false
  end
  
  def documents
    []
  end

  def admin 
    false
  end

  def note
    ""
  end
end