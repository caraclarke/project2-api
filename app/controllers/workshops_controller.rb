class WorkshopsController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

 def create
  @workshop = Workshop.new(workshop_credentials)
  current_user.profile.workshops << @workshop

  if @workshop.save
    render json: @workshop, status: :created, location: @workshop
  else
    render json: @workshop.errors, status: :unprocessable_entity
  end
end

def update
  if current_user.workshops.update(workshop_credentials)
    head :no_content
  else
    render json: @workshop.errors, status: :unprocessable_entity
  end
end

def index
  @workshop = Workshop.all

  render json: @workshop, each_serializer: WorkshopSerializer
end

def show
  if current_workshop.id == params[:id].to_i
    render json: current_workshop, serializer: CurrentWorkshopSerializer
  else
    render json: Workshop.find(params[:id])
  end
end

def find_by_email
  reviews = Workshop.where(email: params[:email])
end

  #current_user.events.new

  def destroy
    current_user.workshop.destroy!

    head :ok
  end

  private

  def workshop_credentials
    params.require(:credentials).permit(:title,
                                        :location,
                                        :about,
                                        :contact_info,
                                        :repeats,
                                        :profile_id,
                                        :organizer_id)
  end
end
