class RatingSerializer < ActiveModel::Serializer
  attributes :id, :comments,
    :quantitative, # quant skills
    :qualitative, # qual skills
    :arts_landscape, # knowledge of arts sector
    :experience, # administration and marketing experience
    :passion, # passion for arts
    :english, # => writing
    :computing, # => computer wrangling
    :applicant_id,
    :rater_id,
    :rater_name

  def rater_name
    object.rater.name
  end
    

end
