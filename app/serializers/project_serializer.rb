class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :instructions, :project_image, :id
end
