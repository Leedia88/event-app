class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :attendances
    has_many :events_attended, through: :attendances, class_name: "Event"
    has_many :events_admin, class_name: "Event"
    after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
     if self.first_name
      self.first_name + " " + self.last_name
     else
      self.email
     end
  end

  def get_events_attended
    list = []
    attendances = Attendance.where(attendee_id: self.id)
    # puts Attendance.joins("INNER JOIN events ON events.id = attendances.event_id AND attendances.attendee_id = self.id" )
    attendances.each do |att|
      list << Event.find(att.event_id)
    end
    list
  end

  def get_events_admin
    list = []
    events = Event.where(admin_id: self.id).order(:start_date)
    events.each do |event|
      list << event
    end
    list
  end
end
