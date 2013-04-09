Zapply.DocumentsController = Ember.ArrayController.extend
  
  lengthIsZero: (->
    @get('length') == 0 || @get('length') == null
  ).property()

  documentString: (->
    length = @get('length')
    if length 
      if length > 1
        "documents"
      else
        "document"
        
  ).property('length')

  # addDocument: (description) ->
    # Zapply.Document.createRecord(description: description)
    # @get('store').commit()

  # addDocument: ->
    # Zapply.Document.find()

  destroyDocument: (document) ->
    confirmation = confirm("Are you sure you want to delete " + document.get('material') + "?")
    if confirmation
      document.deleteRecord()
      @get('store').commit()

  submitApplication: ->
    session = @get('session').get('content')
    session.set("submitted", true)
    @commitData()
    @closeModalSubmit()

  commitData: ->
    @get('store').commit()

  openModalSubmit: ->
    $('#modal_submit').modal('toggle')

  closeModalSubmit: ->
    $('#modal_submit').modal('hide')