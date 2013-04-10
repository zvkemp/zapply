Zapply.Applicant = DS.Model.extend
  email: DS.attr('string')
  submitted: DS.attr('boolean')

  documents: DS.hasMany('App.Document')