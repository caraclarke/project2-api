class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: [:create, :update, :destroy]

  def show
    if current_user.id == params[:id].to_i
      render json: current_user, serializer: CurrentProfileSerializer
    else
      render json: Profile.find(params[:id])
    end
  end

  def create
    @profile = Profile.new(profile_credentials)

    if @profile.save
      current_user.profile = Profile.new(profile_credentials)
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profile.update(profile_credentials)
      head :no_content
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy!

    head :ok
  end

  private

  def profile_credentials
    params.require(:credentials).permit(:surname,
                                      :given_name,
                                      :location,
                                      :about_me,
                                      :gender,
                                      :user_id
                                      )
  end

end
