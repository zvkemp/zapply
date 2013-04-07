Zapply.NewDocumentView = Ember.View.extend
  templateName: 'new_document'
  tagName: 'form'
  classNames: ['new_document', 'form-horizontal']
  attributeBindings: ['action', 'method', 'enctype', 'data-remote']

  action: '/api/documents'
  method: 'post'
  'data-remote': 'true'
  enctype: "multipart/form-data"

  csrf: (->
    $('meta[name=csrf-token]').attr('content');
  ).property()


  submit: ->
    # @get('controller').send('addDocument', @get('newDocumentDescription'))
    console.log 'form submitted'
  #   @get('controller').send('addDocument')
  #   # @set('newDocumentDescription', '')
  #   # false

  didInsertElement: ->
    console.log 'fileupload bound to form'
    console.log $('.new_document')
    $('.new_document').fileupload
      dataType: "json"
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css('width', progress + '%')
      done: (e, data) ->
        resultId = data.result.document.id
        Zapply.Document.find(resultId)