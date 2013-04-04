class Zapply.Views.Navigation.LinkItem extends Backbone.View
  template: JST['navigation/link_item']
  tagName: 'li'



  render: ->
    @$el.html(@template(text: @options.text, link_attributes: @options.link_attributes))
    @