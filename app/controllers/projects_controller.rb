class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  def create
    @project = Project.new(project_params)

    if @project.save
      @project = Project.new(project_params)
      current_user.profile.projects << @project
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :accepted
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def index
    @project = Project.all

    render json: @project, each_serializer: ProjectSerializer
  end

  def show
    render json: @project, serializer: ProjectSerializer
  end

  def find_by_email
    @project = Project.where(email: params[:email])
  end

  #current_user.events.new

  def destroy
    @project.destroy!
    head :ok
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title,
                                    :instructions,
                                    :profile_id,
                                    :project_image)
  end
end
