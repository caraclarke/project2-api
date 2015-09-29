class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :instructions, :project_image, :profile_id, :id

  def profile
    object.profile
  end

end
