class Event < ApplicationRecord
    has_many :attendances
    has_many :attendees, through: :attendances, class_name: "User"
    belongs_to :admin, class_name: "User"
    has_one_attached :avatar

    before_update :is_future?

    validates :start_date, presence: true #impossible de modifier un even dans le passé
    validates :duration, presence: true , if: :is_5_minutes_multiple?#positif et multiple de 5
    validates :description, presence: true, length: { in: 20..1000 }#20 - 1000
    validates :title, presence: true, length: { in: 5..140 } # 5 min max 140
    validates :price, presence: true, numericality: { in: 0..1000}
    validates :location, presence: true

    def is_5_minutes_multiple?
        self.duration%5 == 0 && self.duration > 0
    end

    def is_future?
        self.start_date.to_i > Time.now.to_i
    end

    def get_attendance(user)
        Attendance.find_by(attendee_id: user.id, event_id: self.id)
    end

    def self.search(search)
        if search #le champ est rempli
            result = Event.where(['lower(description) LIKE ? or lower(title) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%"])
            result_bis.map!{ |id| Event.find(id)}
            if result
                @gevent = result
            else
                @event = Event.all
            end
        else #le champ est vide
            @events = Event.all
        end
    end

    def is_free?
        self.price == 0
    end

    def self.pending_list
        list=[]
        pending = Event.where(validated: nil)
        pending.each do |event|
            list << event
        end
        list
    end

    def is_pending?
        validated == nil
    end

end
