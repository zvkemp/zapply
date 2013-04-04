class Zapply.Routers.Base extends Backbone.Router
  routes:
    '': 'home'

  initialize: ->
    @navbar()
  
  home: ->
    view = new Zapply.Views.Home()
    $('#container').html(view.render().el)

  navbar: ->
    view = new Zapply.Views.Navigation.Wrapper()
    $('#backbone_navigation').html(view.render().el)

