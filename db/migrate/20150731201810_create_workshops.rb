class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title, null: false
      t.string :location, null: false, index: true
      t.text :about, null: false
      t.string :contact_info, null: false
      t.string :repeats, null: false
      t.integer :organizer_id, null: false, index: true, foreign_key: true
      t.references :profile, null: false, index: true, foreign_key: true, through: :attendance

      t.timestamps null: false
    end
  end
end
