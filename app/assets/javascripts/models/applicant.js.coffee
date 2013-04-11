Zapply.Applicant = DS.Model.extend
  documents: DS.hasMany('Zapply.Document')
  
  email: DS.attr('string')
  name: DS.attr('string')
  submitted: DS.attr('boolean')
  current_rating_id: DS.attr('number')
  ratings: DS.hasMany('Zapply.Rating')

  current_rating: (->
    c = Zapply.Rating.find(@get('current_rating_id'))
    window.c = c
    c
  ).property('isLoaded')

  average_rating: (->
    '20 [nyi]'
  ).property()
