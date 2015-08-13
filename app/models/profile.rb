class Profile < ActiveRecord::Base
  attr_accessor :profile_picture
  belongs_to :user

  has_many :projects, dependent: :nullify
  has_many :workshops_created, class_name: "Workshop", foreign_key: :organizer_id
  has_many :attendances, dependent: :nullify
  has_many :workshops, through: :attendances

  has_attached_file :profile_picture, #name
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/:attachment/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

end
