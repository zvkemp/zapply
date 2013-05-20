Zapply.ApplicantController = Ember.ObjectController.extend

  commitRating: ->
    @get('current_rating').get('transaction').commit()

  mailTo: (->
    str = "mailto:" + @get('email') + '?subject=Impact%20Manager%20Application%20Confirmation'
  ).property('isLoaded')

  markConfirmationSent: ->
    @set('application_confirmation_sent', true)
    @get('transaction').commit()

  removeFromPool: ->
    @set('under_consideration', false)
    @get('transaction').commit()

  returnToPool: ->
    @set('under_consideration', true)
    @get('transaction').commit()