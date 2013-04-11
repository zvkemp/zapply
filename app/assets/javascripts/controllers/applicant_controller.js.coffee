Zapply.ApplicantController = Ember.ObjectController.extend

  commitRating: ->
    @get('rating').get('transaction').commit()