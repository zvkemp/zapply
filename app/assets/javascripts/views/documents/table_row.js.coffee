class Zapply.Views.Documents.TableRow extends Backbone.View
  tagName: 'tr'
  template: JST['documents/table_row']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(document: @model))
    @