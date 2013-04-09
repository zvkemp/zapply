# DS.RESTAdapter.configure("plurals", session: 'session')

DS.RESTAdapter.map('Zapply.Session', {
  links: { embedded: 'always' }
})

Zapply.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create
    namespace: 'api'


# Zapply.Store.map('Zapply.Session', { links: { embedded: 'always' }})