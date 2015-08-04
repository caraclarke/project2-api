class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :about_me, :user

  def user
    object.user
  end

  def profile_url
    "https://www.amazonaws.com/crosshatch/profiles/profile_pictures/000/000/005/original/image-one.jpg"
  end
end
