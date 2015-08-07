class ProfileSerializer < ActiveModel::Serializer
  attributes :given_name, :surname, :profile_picture, :about_me, :location, :gender, :user_id, :id

  def user
    object.user
  end

  def profile_url
    "https://www.amazonaws.com/crosshatch/profiles/profile_pictures/000/000/005/original/image-one.jpg"
  end
end
