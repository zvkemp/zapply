object @document
attributes :description, :id

node(:material) { |d| d.material_identifier }

# if @document.material
#   node(:material) { @document.material.file.filename } 
# end