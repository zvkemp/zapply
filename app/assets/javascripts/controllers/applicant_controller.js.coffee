Zapply.ApplicantController = Ember.ObjectController.extend

  commitRating: ->
    @get('current_rating').get('transaction').commit()
