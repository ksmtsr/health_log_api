require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザーの作成
  let(:user) { create(:user, email: 'test@example.com', password: 'password123', password_confirmation: 'password123') }

  # emailの存在性のテスト
  it 'emailが存在すれば、有効であること' do
    user = build(:user, email: 'valid@example.com')
    expect(user).to be_valid
  end

  it 'emailが空の場合、無効であること' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  # emailの一意性のテスト
  it 'emailが重複している場合、無効であること' do
    create(:user, email: 'test@example.com')
    user = build(:user, email: 'test@example.com')
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("has already been taken")
  end

  # パスワードのセキュア性のテスト
  it 'passwordが存在すれば、有効であること' do
    user = build(:user, password: 'password123', password_confirmation: 'password123')
    expect(user).to be_valid
  end

  it 'passwordが空の場合、無効であること' do
    user = build(:user, password: nil, password_confirmation: nil)
    expect(user).to_not be_valid
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'passwordとpassword_confirmationが一致しない場合、無効であること' do
    user = build(:user, password: 'password123', password_confirmation: 'differentpassword')
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  # 関連付けのテスト
  it 'userがweight_logsとの関連を持っていること' do
    expect(user).to respond_to(:weight_logs)
  end

  it 'userがdaily_tasksとの関連を持っていること' do
    expect(user).to respond_to(:daily_tasks)
  end

  it 'userがtask_logsとの関連を持っていること' do
    expect(user).to respond_to(:task_logs)
  end

  it 'userがmenstruation_logsとの関連を持っていること' do
    expect(user).to respond_to(:menstruation_logs)
  end

  it 'userがhealth_syncsとの関連を持っていること' do
    expect(user).to respond_to(:health_syncs)
  end

  it 'userがpost_templatesとの関連を持っていること' do
    expect(user).to respond_to(:post_templates)
  end
end
