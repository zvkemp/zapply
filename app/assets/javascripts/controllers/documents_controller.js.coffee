Zapply.DocumentsController = Ember.ArrayController.extend
  
  lengthIsZero: (->
    @get('length') == 0 || @get('length') == null
  ).property()

  # addDocument: (description) ->
    # Zapply.Document.createRecord(description: description)
    # @get('store').commit()

  # addDocument: ->
    # Zapply.Document.find()

  destroyDocument: (document) ->
    document.deleteRecord()
    @get('store').commit()

  submitApplication: ->
    session = @get('session').get('content')
    session.set("submitted", true)
    @get('store').commit()
    console.log "submitted: ", session.get('submitted')
