class AddMaterialToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :material, :string
  end
end
