class Zapply.Views.Documents.Index extends Backbone.View
  template: JST['documents/index']
  id: "my_documents"

  events:
    'remove #modal': 'refreshCollection'

  initialize: ->
    @collection.fetch()
    @listenTo(@collection, 'add', @renderDocument)
    @listenTo(@collection, 'remove', @noDocumentsMessage)
    @listenTo(Zapply.session, 'change', @render)
    @listenTo(@collection, 'reset', @render)

  render: ->
    @$el.html(@logged_in(@template))
    @noDocumentsMessage()
    @renderDocuments()
    @

  renderDocuments: ->
    @collection.each(@renderDocument)

  noDocumentsMessage: ->
    if @collection.length is 0
      @$('#documents_table').append('<tr class="nodocs"><td>You have not uploaded any documents.</td></tr>')

  renderDocument: (document) =>
    console.log 'rendering document'
    $('.nodocs').remove()
    documentView = new Zapply.Views.Documents.TableRow(model: document)
    @$('#documents_table').append(documentView.render().el)

  leave: ->
    @remove()

  refreshCollection: ->
    alert 'refreshCollection!'
    @collection.fetch(reset: 'true')

  handleError: (entry, response) ->
    if response.status == 422 # validation
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  logged_in: (template) =>
    if Zapply.session.attributes.logged_in
      template.call()
    else
      "You are not signed in."