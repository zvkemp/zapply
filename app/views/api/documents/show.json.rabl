object @document
attributes :description, :id
node(:links) do |document|
  if document.material?
    {
      'download' => {
        'href' => download_path(document.to_param)
      }
    }
  else
    {

    }
  end
end