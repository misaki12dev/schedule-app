class Schedule < ApplicationRecord
        validates :title, presence:true
        validates :start_date, presence:true
        validates :end_date, presence:true
        validates :memo, length: {in:0..100}

        validate :start_end_checker

        def start_end_checker
          errors.add(:end_date, "は開始日以降にしてください") unless
          self.start_date  < self.end_date
        end
end
