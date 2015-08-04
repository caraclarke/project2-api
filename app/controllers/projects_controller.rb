class ProjectsController < ApplicationController
  skip_before_action :authenticate, only: [:create, :update, :destroy]

  def index
    @projects = Project.all

    render json: @projects, each_serializer: ProjectSerializer
  end

  def show
    if current_project.id == params[:id].to_i
      render json: current_project, serializer: CurrentProjectSerializer
    else
      render json: Project.find(params[:id])
    end
  end

  def create
    @projects = Project.new(project_credentials)

    if @projects.save
      render json: @projects, status: :created, location: @projects
    else
      render json: @projects.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.projects.update(project_credentials)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
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
                                        :profile_id)
  end
end
