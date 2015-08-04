class Workshop < ActiveRecord::Base
  has_one :profile, foreign_key: "organizer_id", through: :attendance
  has_many :attendances
  has_many :profiles, through: :attendances

  has_attached_file :workshop_image,  #Or whatever you want to call the image you're uploading.
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :workshop_image, :content_type => /\Aimage\/.*\Z/
end
