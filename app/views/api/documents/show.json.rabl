object @document
attributes :description, :id

node(:material) { |d| d.material_identifier }
node(:download_path) { |d| download_path(d)      }

# if @document.material
#   node(:material) { @document.material.file.filename } 
# end