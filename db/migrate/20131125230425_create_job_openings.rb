class CreateJobOpenings < ActiveRecord::Migration
  def change
    create_table :job_openings do |t|
      t.string :description
      t.timestamps

    end
  end
end
