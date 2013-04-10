Zapply.Router.map (match)->
  # match('/').to('index')
  @route 'home', path: '/'
  @route 'applicants', path: '/applicants'
  @route 'applicant', path: '/applicants/:applicant_id'
  @route 'documents', path: '/my_application'



Zapply.HomeRoute = Ember.Route.extend
  renderTemplate: ->
    @render('job_description') # handlebars template



Zapply.DocumentsRoute = Ember.Route.extend
  model: -> Zapply.Document.find()

  renderTemplate: ->
    @render('my_documents')



Zapply.ApplicantsRoute = Ember.Route.extend
  model: -> Zapply.Applicant.find()

Zapply.ApplicantRoute = Ember.Route.extend
  model: (params) -> Zapply.Applicant.find(params.applicant_id)
  # setupController: (controller, applicant)->
    # window.a = controller.get('content')

