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
    if confirm("Once you submit your application, it will be transmitted to WolfBrown and you will no longer be able to edit it. Are you sure you want to proceed?")
      session = @get('session').get('content')
      session.set("submitted", true)
      @get('store').commit()
