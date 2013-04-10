DS.RESTAdapter.configure('Zapply.Document', sideloadAs: 'documents')

Zapply.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create
    namespace: 'api'

# Zapply.Store.registerAdapter('Zapply.Applicant', DS.RESTAdapter.extend
  # url: 'api/admin'
# )

# TODO: there is a bug on committing to the store with custom model adapters -
# may need to ditch the admin api namespace for now and use the general 'api' namespace.
# Should be able to define an Api::AdminController to use as a platform for the other admin
# controllers.
# https://github.com/emberjs/data/issues/739