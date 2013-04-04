class Zapply.Views.Documents.TableRow extends Backbone.View
  tagName: 'tr'
  template: JST['documents/table_row']

  events:
    'click .delete': 'delete'

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(document: @model))
    @

  delete: (event) =>
    event.preventDefault()
    @off()
    @model.destroy()
    @remove()

