Zapply.Session = DS.Model.extend
  email: DS.attr('string')
  name: DS.attr('string')
  signed_in: DS.attr('boolean')
  submitted: DS.attr('boolean')
  admin: DS.attr('boolean')
  note: DS.attr('string')