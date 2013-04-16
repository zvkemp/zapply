Zapply.ApplicantsController = Ember.ArrayController.extend
  
  filterHasRating: ( ->
    @get('content').filterProperty('average_rating')
  ).property('@each.average_rating')