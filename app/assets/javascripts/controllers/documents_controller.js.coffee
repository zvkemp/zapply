Zapply.DocumentsController = Ember.ArrayController.extend
  
  lengthIsZero: Ember.computed(->
    @get('length') == 0 || @get('length') == null
  ).property('@content')

  # addDocument: (description) ->
    # Zapply.Document.createRecord(description: description)
    # @get('store').commit()

  # addDocument: ->
    # Zapply.Document.find()

  destroyDocument: (document) ->
    document.deleteRecord()
    @get('store').commit()