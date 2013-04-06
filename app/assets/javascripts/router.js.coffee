Zapply.Router.map (match)->
  # match('/').to('index')

  @route 'home', path: '/'

Zapply.HomeRoute = Ember.Route.extend
  setupController: (controller) ->
    console.log controller

