class AddSubmittalNoteToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :note
    end
  end
end
