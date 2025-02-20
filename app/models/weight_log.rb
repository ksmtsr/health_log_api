class WeightLog < ApplicationRecord
    belongs_to :user

    # weight_diff を自動計算する
    before_save :calculate_weight_diff

    private

    def calculate_weight_diff
      # 最新の1件を取得
      last_log = user.weight_logs.order(recorded_at: :desc).first
  
      # もし前回のデータがあれば、その差分を計算
      self.weight_diff = last_log ? weight - last_log.weight : 0.0
    end

    def bmi
      return nil unless user&.height.present? && weight.present?
      (weight / ((user.height / 100.0) ** 2)).round(2)
    end
    
    validates :weight, presence: true
    validates :recorded_at, presence: true
  end
  