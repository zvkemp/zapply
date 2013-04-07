Zapply.Router.map (match)->
  # match('/').to('index')
  @route 'home', path: '/'
  @route 'documents', path: '/my_documents'

Zapply.HomeRoute = Ember.Route.extend
  renderTemplate: ->
    @render('job_description') # handlebars template

Zapply.DocumentsRoute = Ember.Route.extend
  model: -> Zapply.Document.find()

  setupController: (controller, model) ->
    controller.set('content', model)
    console.log controller
    console.log controller.get('length')
    console.log controller.get('lengthIsZero')

  renderTemplate: ->
    @render('my_documents')