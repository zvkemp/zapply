class Zapply.Routers.Base extends Backbone.Router
  routes:
    '': 'home'
    'my_documents': 'documentsIndex'

  initialize: ->
    @navbar()
  
  home: ->
    if !@homeView # view is never 'removed'
      @homeView = new Zapply.Views.Home()
    $('#container').html(@homeView.render().el)

  navbar: ->
    view = new Zapply.Views.Navigation.Wrapper()
    $('#backbone_navigation').html(view.render().el)

  documentsIndex: ->
    if !@myDocumentsView # view is never 'removed'
      @myDocumentsView = new Zapply.Views.Documents.Index()
    $('#container').html(@myDocumentsView.render().el)