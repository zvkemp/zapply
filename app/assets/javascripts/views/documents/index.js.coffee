class Zapply.Views.Documents.Index extends Backbone.View
  template: JST['documents/index']
  id: "my_documents"

  events:
    'submit #new_document': 'createDocument'

  initialize: ->
    @collection.fetch()
    @listenTo(@collection, 'add', @renderDocument)
    @listenTo(@collection, 'remove', @noDocumentsMessage)
    @listenTo(Zapply.session, 'change', @render)

  render: ->
    @$el.html(@logged_in(@template))
    @noDocumentsMessage()
    @

  noDocumentsMessage: ->
    if @collection.length is 0
      @$('#documents_table').append('<tr class="nodocs"><td>You have not uploaded any documents.</td></tr>')

  renderDocument: (document) =>
    $('.nodocs').remove()
    documentView = new Zapply.Views.Documents.TableRow(model: document)
    @$('#documents_table').append(documentView.render().el)

  leave: ->
    @remove()

  createDocument: (event) ->
    event.preventDefault()
    attributes = 
      description: $('#document_description').val()
      material: $('#document_material').val()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_document')[0].reset()
      error: @handleError


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