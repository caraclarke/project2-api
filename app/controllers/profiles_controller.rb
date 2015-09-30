class ProfilesController < ApplicationController
  before_filter :set_profile, only: [:show, :update, :destroy]
  skip_before_action :authenticate

  def show
    @profile = Profile.find(params[:id])
    render json: @profile, serializer: ProfileSerializer
  end

  def create
    if @profile.save
      @profile.profile = Profile.new(profile_params)
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy!
    head :ok
  end

  private

  def set_profile
     @profile = Profile.find(params[:id])
   end

  def project_params
    params.require(:project).permit(:title,
                                    :instructions,
                                    :profile_id,
                                    :project_image)
  end

  def profile_params
    params.require(:profile).permit(:surname,
                                      :given_name,
                                      :location,
                                      :about_me,
                                      :gender,
                                      :profile_picture,
                                      :user_id
                                      )
  end
end
