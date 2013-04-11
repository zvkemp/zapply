Zapply.Rating = DS.Model.extend
  comments: DS.attr('string')
  quantitative: DS.attr('number')
  qualitative: DS.attr('number')
  arts_landscape: DS.attr('number')
  experience: DS.attr('number')
  passion: DS.attr('number')
  english: DS.attr('number')
  computing: DS.attr('number')

  rater_name: DS.attr('string')
  applicant: DS.belongsTo('Zapply.Applicant')

  categories: [
    'quantitative'
    'qualitative'
    'arts_landscape'
    'experience'
    'passion'
    'english'
    'computing'
  ]

  average: (->
    sum   = 0
    count = 0.0

    for cat in @categories
      n = parseInt @get(cat)
      if n
        sum += n
        count += 1
    (sum / count).toFixed(1)

  ).property('quantitative', 'qualitative', 'arts_landscape', 'experience', 'passion', 'english', 'computing')

  # averageRating: Ember.computed(->
  #   r     = @get('rating')
  #   sum   = 0
  #   count = 0.0

  #   for cat in @ratings
  #     n = parseInt r.get(cat)
  #     if n
  #       sum += n
  #       count += 1.0

  #   sum / count

  # ).property('rating.quantitative', 'rating.qualitative', 'rating.arts_landscape', 'rating.experience', 'rating.passion', 'rating.english', 'rating.computing')
