class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:login, :create]

  # POST /login
  def login
    credentials = user_credentials
    token = User.login(credentials[:email], credentials[:password])
    if token
      render json: { token: token }
    else
      head :unauthorized
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users, each_serializer: UserSerializer
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user.id == params[:id].to_i
      render json: current_user, serializer: CurrentUserSerializer
    else
      render json: User.find(params[:id])
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_credentials)

    if @user.save
      @user.profile = Profile.new(profile_credentials)
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.update(user_credentials)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #current_user.events.new

  # user = User.find(params[:id])
  #   if user.update(user_params)
  #     user.save
  #     render json: user
  #   else
  #     render json: movie.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    current_user.destroy!

    head :ok
  end

  private

  def user_credentials
    params.require(:credentials).permit(:email,
                                        :password,
                                        :password_confirmation)
  end

   def profile_credentials
    params.require(:credentials).permit(:surname,
                                      :given_name,
                                      :location,
                                      :about_me,
                                      :gender,
                                      :user_id,
                                      :profile_picture)
  end
end
