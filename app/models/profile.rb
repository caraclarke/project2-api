class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :projects
  has_many :attendances
  has_many :workshops, through: :attendances
  has_one :workshop

  has_attached_file :profile_picture,  #Or whatever you want to call the image you're uploading.
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

end
