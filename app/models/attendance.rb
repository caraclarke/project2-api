class Attendance < ActiveRecord::Base
  belongs_to :organizer
  belongs_to :workshop

  has_many :profiles

end
