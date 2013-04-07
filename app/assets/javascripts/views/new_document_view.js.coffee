Zapply.NewDocumentView = Ember.View.extend
  templateName: 'new_document'
  tagName: 'form'
  classNames: 'form-horizontal'

  submit: ->
    @get('controller').send('addDocument', @get('newDocumentDescription'))
    @set('newDocumentDescription', '')
    false