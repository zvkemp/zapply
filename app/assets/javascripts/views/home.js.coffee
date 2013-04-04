class Zapply.Views.Home extends Backbone.View
  template: JST['home']

  initialize: ->
    @listenTo(Zapply.session, 'change', @renderApplyLink)

  render: ->
    @$el.html(@template())
    @