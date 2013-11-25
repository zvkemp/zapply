class CreateJobOpenings < ActiveRecord::Migration
  def change
    create_table :job_openings do |t|
      t.string :title
      t.string :location
      t.text :description
      t.references :user
      t.date :open_date
      t.date :closed_date
      t.timestamps
    end
  end
end
