class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title, null: false
      t.string :location, null: false, index: true
      t.text :about, null: false
      t.string :contact_info, null: false
      t.string :repeats, null: false
      t.references :organizer, null: false, index: true

      t.timestamps null: false
    end

    add_foreign_key :workshops, :profiles, column: :organizer_id
  end
end
