class Project < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :project_image,  #Or whatever you want to call the image you're uploading.
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "../assets/images/default-object-image.jpg"
  validates_attachment_content_type :project_image, :content_type => /\Aimage\/.*\Z/
end
