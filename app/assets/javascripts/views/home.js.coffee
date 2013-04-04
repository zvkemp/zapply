class Zapply.Views.Home extends Backbone.View
  template: JST['home']

  initialize: ->
    @listenTo(Zapply.session, 'change', @insertHeroLink)

  render: ->
    @$el.html(@template())
    @insertHeroLink()
    @

  insertHeroLink: ->
    if Zapply.session.attributes.session_links
      @$('#actions').html(@heroLink())

  heroLink: ->
    link = "<a class='btn btn-large btn-success' href=\""
    if Zapply.session.attributes.logged_in
      link += @myDocumentsLink()
    else
      link += @applyLink()

  applyLink: ->
    "#{Zapply.session_link('sign up').href}\">Apply Now</a>"

  myDocumentsLink: ->
    "#{Zapply.session_link('My Documents').href}\">My Documents</a>"

  leave: ->
    @remove()