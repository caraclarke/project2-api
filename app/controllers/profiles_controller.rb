class ProfilesController < ApplicationController
  before_filter :set_profile, only: [:show, :update, :destroy]
  skip_before_action :authenticate

 #  def index
 #   if params[:limit]
 #     profiles = current_user ? current_user.profiles : []
 #     byebug
 #     render json: profiles
 # end

  def show
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

  def profile_params
    params.require(:profile).permit(:surname,
                                      :given_name,
                                      :location,
                                      :about_me,
                                      :gender,
                                      :user_id
                                      )
  end
end
