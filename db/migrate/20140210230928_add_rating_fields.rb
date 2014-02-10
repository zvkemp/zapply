class AddRatingFields < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.integer :research
      t.integer :archiving
    end
  end
end
