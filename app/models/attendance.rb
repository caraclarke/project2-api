class Attendance < ActiveRecord::Base
  belongs_to :profile
  belongs_to :workshop

end
