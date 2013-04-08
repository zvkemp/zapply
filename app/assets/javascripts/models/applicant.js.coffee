Zapply.Applicant = DS.Model.extend
  email: DS.attr('string')
  submitted: DS.attr('boolean')


Zapply.Applicant.reopenClass
  url: 'admin/applicants'