class Zapply.Views.Navigation.Wrapper extends Backbone.View
  template: JST['navigation/wrapper']
  tagName: 'ul'
  className: 'nav'

  initialize: ->
    @listenTo(Zapply.session, 'change', @render)

  render: ->
    @$el.html(@template())
    @insertEmail()
    @insertSessionLinks()
    @

  insertEmail: ->
    @$el.append("<li><a href='#'>#{Zapply.session.get('email')}</a></li>")

  insertSessionLinks: =>
    for text, attributes of Zapply.session.get('session_links')
      link  = "<li><a "
      for attribute, value of attributes
        link += "#{attribute}=\"#{value}\""
      link += ">#{text}</a></li>"
      @$el.append(link)
