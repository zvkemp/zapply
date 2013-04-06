Zapply.ApplicationController = Ember.Controller.extend
  # session: Zapply.Session.find(1);
  init: ->
    @_super()
    console.log 'ApplicationController init'
    Zapply.session = 
      sessionObject: Zapply.Session.find(1)
      email:    -> Zapply.session.sessionObject.get('email')
      signedIn: -> Zapply.session.sessionObject.get('signed_in')
