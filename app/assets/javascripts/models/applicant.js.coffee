Zapply.Applicant = DS.Model.extend
  documents: DS.hasMany('App.Document')
  
  email: DS.attr('string')
  submitted: DS.attr('boolean')
