class Project < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :project_image,
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/:attachment/:style/missing.png"
  validates_attachment_content_type :project_image, :content_type => /\Aimage\/.*\Z/
end
