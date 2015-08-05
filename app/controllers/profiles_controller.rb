class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: [:show]

  def show
    @profile = Profile.find(params[:id])
    render json: @profile, serializer: ProfileSerializer
  end

  def create
    @profile = Profile.new(profile_credentials)

    if @profile.save
      @profile.profile = Profile.new(profile_credentials)
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    @profile = Profile.find(params[:id]) # delete?
    if @profile.update(profile_credentials)
      head :no_content
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile
      @profile.destroy!
    end

    head :ok
  end

  private

  # def set_profile
  #    @profile = Profile.find(params[:id])
  #  end

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
