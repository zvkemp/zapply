console.log 'session initializer loaded'
Ember.Application.initializer
  name: 'session'

  initialize: (container) ->
    session    = Zapply.Session.find(1)
    controller = container.lookup('controller:session').set('content', session)
    container.typeInjection('controller', 'session', 'controller:session')