class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: [:show]

  def show
    user = User.find_by(token: session[:token])
    if user
      @profile = Profile.find_by(user_id: user.id)
      render json: @profile, serializer: ProfileSerializer
    else
      head :unauthorized
    end
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
