Zapply.NewDocumentView = Ember.View.extend
  templateName: 'new_document'
  tagName: 'form'

  submit: ->
    @get('controller').send('addDocument', @get('newDocumentDescription'))
    @set('newDocumentDescription', '')
    false