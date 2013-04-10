Zapply.Document = DS.Model.extend
  description: DS.attr('string')
  material: DS.attr('string')
  download_href: DS.attr('string')

  applicant: DS.belongsTo('Zapply.Applicant')