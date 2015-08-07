class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :date
      t.references :profile, index: true, foreign_key: true
      t.references :workshop, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
