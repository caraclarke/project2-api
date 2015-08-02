class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :instructions, null: false
      t.references :profile, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
