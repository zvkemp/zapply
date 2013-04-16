Zapply.Applicant = DS.Model.extend
  documents: DS.hasMany('Zapply.Document')
  
  email: DS.attr('string')
  name: DS.attr('string')
  note: DS.attr('string')
  submitted: DS.attr('boolean')
  application_confirmation_sent: DS.attr('boolean')
  current_rating_id: DS.attr('number')
  ratings: DS.hasMany('Zapply.Rating')

  current_rating: (->
    Zapply.Rating.find(@get('current_rating_id'))
  ).property('isLoaded')

  average_rating: (->
    averages = @get('ratings').map (r) -> r.get('average')
    count = 0
    sum = averages.reduce (x, y) ->
      if n = parseFloat(y)
        x += n 
        count += 1
      x
    , 0.0

    avg = (sum / count).toFixed(1)
    if avg == "NaN" then "" else avg

  ).property('ratings.@each.average')



  # average_rating: (->
  #   sum = 0
  #   count = 0

  #   for rating in @get('ratings')
  #     a = r.get('average')
  #     console.log rating
  #     if a
  #       sum += a
  #       count += 1
  #       console.log "YES:::", a, sum, count

  #   (sum / count).toFixed(1)
  # ).property('ratings.@each.average')
