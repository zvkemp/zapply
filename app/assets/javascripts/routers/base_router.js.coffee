class Zapply.Routers.Base extends Backbone.Router

  routes:
    '': 'home'
    'my_documents': 'documentsIndex'
    # 'my_documents/new': 'documentsNew'

  initialize: ->
    @el = $('#container')
    @navbar()
  
  home: ->
    view = new Zapply.Views.Home()
    @swap(view)

  navbar: ->
    view = new Zapply.Views.Navigation.Wrapper()
    $('#backbone_navigation').html(view.render().el)

  # documentsIndex: ->
  #   console.log 'documentsIndex!'
  #   @loggedIn =>
  #     view = new Zapply.Views.Documents.Index()    
  #     @swap(view)
  # TODO: this creates some issues when the session.json hasn't caught up yet - redirects even when logged in.

  documentsIndex: =>
    documents = new Zapply.Collections.Documents
    view = new Zapply.Views.Documents.Index(collection: documents)  
    @swap(view)

  # documentsNew: =>
    # @redirectBaseView(Zapply.Views.Documents.Index, @documentsIndex)
      

  swap: (newView) =>
    @currentView.leave() if (@currentView and @currentView.leave)
    @currentView = newView
    @el.html(@currentView.render().el)

  redirectToLogin: ->
    window.location.href = '/users/sign_in'

  loggedIn: (functionIfTrue) =>
    if Zapply.session.get('logged_in')
      functionIfTrue.call()
    else
      @redirectToLogin()

  # redirectBaseView: (viewClass, functionToShow) =>
  #   if (@currentView && @currentView.constructor is not viewClass) || !@currentView
  #     functionToShow.call()