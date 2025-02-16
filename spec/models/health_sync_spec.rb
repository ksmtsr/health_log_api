require 'rails_helper'

RSpec.describe HealthSync, type: :model do
  # userとの関連のテスト
  it 'userが関連付けられている場合、有効であること' do
    user = create(:user)
    health_sync = build(:health_sync, user: user)
    expect(health_sync).to be_valid
  end

  it 'userが関連付けられていない場合、無効であること' do
    health_sync = build(:health_sync, user: nil)
    expect(health_sync).to_not be_valid
  end

  # health_dataのバリデーション
  it 'health_dataが存在する場合、有効であること' do
    health_sync = build(:health_sync, health_data: { weight: 70, height: 170 })
    expect(health_sync).to be_valid
  end

  it 'health_dataがnilの場合、無効であること' do
    health_sync = build(:health_sync, health_data: nil)
    expect(health_sync).to_not be_valid
  end

  # synced_atのバリデーション
  it 'synced_atが存在する場合、有効であること' do
    health_sync = build(:health_sync, synced_at: Time.current)
    expect(health_sync).to be_valid
  end

  it 'synced_atがnilの場合、無効であること' do
    health_sync = build(:health_sync, synced_at: nil)
    expect(health_sync).to_not be_valid
  end
end
