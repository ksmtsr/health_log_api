require 'rails_helper'

RSpec.describe WeightLog, type: :model do
  let(:user) { create(:user) }

  # 体重ログの作成
  it 'weightとrecorded_atがある場合、有効であること' do
    weight_log = build(:weight_log, user: user, weight: 70.0, recorded_at: Time.now)
    expect(weight_log).to be_valid
  end

  it 'weightがない場合、無効であること' do
    weight_log = build(:weight_log, user: user, weight: nil, recorded_at: Time.now)
    expect(weight_log).to_not be_valid
    expect(weight_log.errors[:weight]).to include("can't be blank")
  end

  it 'recorded_atがない場合、無効であること' do
    weight_log = build(:weight_log, user: user, weight: 70.0, recorded_at: nil)
    expect(weight_log).to_not be_valid
    expect(weight_log.errors[:recorded_at]).to include("can't be blank")
  end

  # weight_diffの計算テスト
  context 'weight_diffの計算' do
    it '最新の体重記録との差分を正しく計算すること' do
      # 最初の体重ログを作成
      weight_log_1 = create(:weight_log, user: user, weight: 70.0, recorded_at: Time.now)

      # 2番目の体重ログを作成
      weight_log_2 = create(:weight_log, user: user, weight: 72.0, recorded_at: Time.now + 1.day)

      # 2番目のログのweight_diffは、前回のログとの差分であるべき
      expect(weight_log_2.weight_diff).to eq(2.0) # 72.0 - 70.0 = 2.0
    end

    it '最初の体重ログの場合、weight_diffは0.0であること' do
      weight_log = create(:weight_log, user: user, weight: 70.0, recorded_at: Time.now)
      expect(weight_log.weight_diff).to eq(0.0)
    end
  end
end
