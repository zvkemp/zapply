window.Zapply =
  Models: {}
  Collections: {}
  Views:
    Navigation: {}
  Routers: {}
  initialize: -> 
    @session = new Zapply.Models.Session
    @session.fetch()
    new Zapply.Routers.Base()
    Backbone.history.start()
