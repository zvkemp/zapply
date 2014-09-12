class JobOpening < ActiveRecord::Base
  attr_accessible :title, :location, :description,
    :open_date, :closed_date


  def self.current
    first
  end

end
