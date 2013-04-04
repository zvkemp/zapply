class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :description
      t.references :user
      t.timestamps

    end
  end
end
