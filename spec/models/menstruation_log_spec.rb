require 'rails_helper'

RSpec.describe MenstruationLog, type: :model do
  it 'userが関連付けられている場合、有効であること' do
    user = create(:user)
    menstruation_log = build(:menstruation_log, user: user)
    expect(menstruation_log).to be_valid
  end

  it 'userが関連付けられていない場合、無効であること' do
    menstruation_log = build(:menstruation_log, user: nil)
    expect(menstruation_log).to_not be_valid
  end

  it 'start_dateとend_dateがある場合、有効であること' do
    menstruation_log = build(:menstruation_log, start_date: '2025-02-01', end_date: '2025-02-05') 
    expect(menstruation_log).to be_valid
  end

  it 'start_dateがnilの場合、無効であること' do
    menstruation_log = build(:menstruation_log, start_date: nil)
    expect(menstruation_log).to_not be_valid
  end

  it 'end_dateがnilの場合、無効であること' do
    menstruation_log = build(:menstruation_log, end_date: nil)
    expect(menstruation_log).to_not be_valid
  end

  it 'cycle_lengthが整数の場合、有効であること' do
    menstruation_log = build(:menstruation_log, cycle_length: 28)
    expect(menstruation_log).to be_valid
  end

  it 'cycle_lengthが整数でない場合、無効であること' do
    menstruation_log = build(:menstruation_log, cycle_length: '28日')
    expect(menstruation_log).to_not be_valid
  end

  it 'period_lengthが整数の場合、有効であること' do
    menstruation_log = build(:menstruation_log, period_length: 5)
    expect(menstruation_log).to be_valid
  end

  it 'period_lengthが整数でない場合、無効であること' do
    menstruation_log = build(:menstruation_log, period_length: '5日')
    expect(menstruation_log).to_not be_valid
  end
end
