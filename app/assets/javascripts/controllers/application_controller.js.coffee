Zapply.ApplicationController = Ember.Controller.extend
  # session: Zapply.Session.find(1);
  init: ->
    @_super()
    console.log 'ApplicationController init'
    # @set('session', Zapply.Session.find(1))
    Zapply.session = Zapply.Session.find(1)

