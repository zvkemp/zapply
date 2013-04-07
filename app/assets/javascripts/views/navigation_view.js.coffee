Zapply.NavigationView = Ember.View.extend
  templateName: 'navigation'
  name: 'navigation'
  tagName: 'ul'
  classNames: ['nav']

  email: 'navView email'

  propEmail: ( ->
    'propEmail'
  ).property()