showdown = new Showdown.converter()
Ember.Handlebars.registerBoundHelper('markdown', (input) ->
  input = '' unless input
  new Ember.Handlebars.SafeString(showdown.makeHtml(input))
)