class Rating < ActiveRecord::Base
  attr_accessible :rater, :applicant

  attr_accessible :comments,
    :quantitative, # quant skills
    :qualitative, # qual skills
    :arts_landscape, # knowledge of arts sector
    :experience, # administration and marketing experience
    :passion, # passion for arts
    :english, # => writing
    :computing # => computer wrangling
    
    # :web_production, #
    # :social_media
    # :cultural_sensitivity, # no
    # :communication, # no
    # :organization, # no
    # :artistic_training, # no


  belongs_to :rater, class_name: 'User'
  belongs_to :applicant, class_name: 'User'
end
