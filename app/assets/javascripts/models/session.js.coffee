# Zapply.SessionManager = Ember.StateManager.extend
#   initialState: "signedOut"
#   states:
#     signedIn: Ember.State.create()
#     signedOut: Ember.State.create()

Zapply.Session = DS.Model.extend
  email: DS.attr('string')
  signed_in: DS.attr('boolean')
  # init: ->
    # @set("sessionManager", Zapply.SessionManager.create())
    # @_super()
    # @get("sessionManager").transitionTo("signedIn") if @get('signed_in')
  # links: DS.hasMany('string', embedded: true)