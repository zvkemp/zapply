Zapply.Document = DS.Model.extend
  applicant: DS.belongsTo('Zapply.Applicant')
  
  description: DS.attr('string')
  material: DS.attr('string')
  download_href: DS.attr('string')
  image_href: DS.attr('string')
