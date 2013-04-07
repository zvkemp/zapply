Zapply.NewDocumentView = Ember.View.extend
  templateName: 'new_document'

  csrf: (->
    $('meta[name=csrf-token]').attr('content');
  ).property()

  submit: ->
    # @get('controller').send('addDocument', @get('newDocumentDescription'))
    @get('controller')
    # @set('newDocumentDescription', '')
    # false