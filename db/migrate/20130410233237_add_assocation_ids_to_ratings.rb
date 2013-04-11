class AddAssocationIdsToRatings < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.integer :rater_id
      t.integer :applicant_id
    end
  end
end
