class Workshop < ActiveRecord::Base
  has_one :profile, foreign_key: "organizer_id", through: :attendance
  has_many :attendances
  has_many :profiles, through: :attendances

  has_attached_file :workshop_image,
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/:attachment/:style/missing.png"
  validates_attachment_content_type :workshop_image, :content_type => /\Aimage\/.*\Z/
end
