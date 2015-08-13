class AddAttachmentWorkshopImageToWorkshops < ActiveRecord::Migration
  def self.up
    change_table :workshops do |t|
      t.attachment :workshop_image
    end
  end

  def self.down
    remove_attachment :workshops, :workshop_image
  end
end
