class AttendancesController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

  def show
    if current_user.id == params[:id].to_i
      render json: Attendance.find(params[:id]), serializer: CurrentAttendanceSerializer
    else
      render json: Attendance.find(params[:id])
    end
  end

  def create
    @attendance = Attendance.new(attendance_credentials)
    current_user.profile.attendances << @attendance

    if @attendance.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_credentials)
      head :no_content
    else
      render json: attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    if @attendance
      @attendance.destroy!
    end

    head :ok
  end

  private

  def attendance_credentials
    params.require(:credentials).permit(:date,
                                      :workshop_id,
                                      :profile_id
                                      )
  end
end
