class MenstruationLog < ApplicationRecord
    belongs_to :user
  
    validates :start_date, :end_date, presence: true
    validates :cycle_length, :period_length, numericality: { only_integer: true }
  end
  