window.Zapply =
  shared: {}
  Models: {}
  Collections: {}
  Views:
    Navigation: {}
    Documents: {}
  Routers: {}
  initialize: -> 
    @session = new Zapply.Models.Session
    @session.fetch()
    @documents = new Zapply.Collections.Documents
    new Zapply.Routers.Base()
    Backbone.history.start()

  session_links: ->
    @session.attributes.session_links

  session_link: (name) ->
    @session_links()[name]