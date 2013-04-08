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


  didInsertElement: ->
    $('.new_document').fileupload
      dataType: "json"
      progressall: (e, data) ->
        $('#progress').show()
        progress = parseInt(data.loaded / data.total * 100, 10)
        $('#progress .bar').css('width', progress + '%')
        if progress == 100
          $('#progress').hide()
      done: (e, data) ->
        resultId = data.result.document.id
        Zapply.Document.find(resultId)
