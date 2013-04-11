class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.text :comments
      
      t.integer :quantitative
      t.integer :qualitative
      t.integer :arts_landscape
      t.integer :artistic_training

      t.integer :experience
      t.integer :passion
      t.integer :communication
      t.integer :organization
      t.integer :english
      t.integer :cultural_sensitivity
      t.integer :computing
      t.integer :web_production
      t.integer :social_media

      t.timestamps
    end
  end
end
