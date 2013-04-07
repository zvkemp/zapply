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

  didInsertElement: ->
    $('#new_document').fileupload
      dataType: "script"
      # add: (e, data) ->
        # data.context = $(tmpl("template-upload", data.files[0]))
        # $('#new_document').append(data.context)
        # data.submit()
      # progress: (e, data) ->
        # if data.context
          # progress = parseInt(data.loaded / data.total * 100, 10)
          # data.context.find('.bar').css('width', progress + '%')


