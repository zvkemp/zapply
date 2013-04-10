Zapply.Applicant = DS.Model.extend
  documents: DS.hasMany('Zapply.Document')
  
  email: DS.attr('string')
  submitted: DS.attr('boolean')