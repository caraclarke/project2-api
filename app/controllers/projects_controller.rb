class ProjectsController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

# need projects serializer

  def create
    @project = Project.new(project_credentials)
    current_user.profile.projects << @project

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.projects.update(project_credentials)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def index
    @project = Project.all

    render json: @project, each_serializer: ProjectSerializer
  end

  def show
    if current_project.id == params[:id].to_i
      render json: current_project, serializer: CurrentProjectSerializer
    else
      render json: Project.find(params[:id])
    end
  end

  def find_by_email
    reviews = Project.where(email: params[:email])
  end

  #current_user.events.new

  def destroy
    current_user.projects.destroy!

    head :ok
  end

  private

  def project_credentials
    params.require(:credentials).permit(:title,
                                        :instructions,
                                        :profile_id,
                                        :project_image)
  end
end
