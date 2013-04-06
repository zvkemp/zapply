class Zapply.Views.Documents.TableRow extends Backbone.View
  tagName: 'tr'
  template: JST['documents/table_row']

  events:
    'click .delete': 'delete'

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(document: @model))
    @insertLinks()
    @

  delete: (event) =>
    event.preventDefault()
    @off()
    @model.destroy()
    @remove()

  insertLinks: =>
    for text, attributes of @model.get('links')
      link = "<a class='btn btn-small' "
      for attribute, value of attributes
        link += "#{attribute}=\"#{value}\""
      link += ">#{text}</a></li>"
      @$('.document-actions').append(link)
