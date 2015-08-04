class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :surname, null: false, index: true
      t.string :given_name, null: false
      t.string :location, null: false
      t.text :about_me, null: false
      t.string :gender
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

#information saved to both users and profiles
#connect in user create
#user.new and profile.new at the same time
