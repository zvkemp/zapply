Zapply.Router.map (match)->
  # match('/').to('index')
  @route 'home', path: '/'
  @route 'documents', path: '/my_documents'
  @route 'applicants', path: '/applicants'


Zapply.HomeRoute = Ember.Route.extend
  renderTemplate: ->
    @render('job_description') # handlebars template

Zapply.DocumentsRoute = Ember.Route.extend
  model: -> Zapply.Document.find()

  renderTemplate: ->
    @render('my_documents')

Zapply.ApplicantsRoute = Ember.Route.extend
  model: -> Zapply.Applicant.find()