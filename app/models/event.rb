class Event < ApplicationRecord
    has_many :attendances
    has_many :attendees, through: :attendances, class_name: "User"
    belongs_to :admin, class_name: "User"

    before_update :is_future?

    validates :start_date, presence: true #impossible de modifier un even dans le passé
    validates :duration, presence: true , if: :is_5_minutes_multiple?#positif et multiple de 5
    validates :description, presence: true, length: { in: 20..1000 }#20 - 1000
    validates :title, presence: true, length: { in: 5..140 } # 5 min max 140
    validates :price, presence: true, numericality: { in: 1..1000}
    validates :location, presence: true

    def is_5_minutes_multiple?
        self.duration%5 == 0 && self.duration > 0
    end

    def is_future?
        self.start_date.to_i > Time.now.to_i
    end

end
