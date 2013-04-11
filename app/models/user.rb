class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :submitted, :note, :name
  # attr_accessible :title, :body

  has_many :documents
  has_many :ratings, foreign_key: :applicant_id
  has_many :applicant_ratings, :class_name => "Rating", foreign_key: :rater_id

  def self.applicants
    where(admin: false)
  end

  def submit!
    update_attributes(submitted: true)
  end

end
