# DS.RESTAdapter.configure("plurals", session: 'session')

Zapply.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create
    namespace: 'api'
