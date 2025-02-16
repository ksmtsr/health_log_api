require 'rails_helper'

RSpec.describe DailyTask, type: :model do
  let(:user) { create(:user) }
  let(:daily_task) { create(:daily_task, user: user) }

  # バリデーションのテスト
  describe 'バリデーション' do
    it '名前がある場合、有効であること' do
      daily_task.name = 'テストタスク'
      expect(daily_task).to be_valid
    end
    
    it '名前がない場合、有効であること' do
      daily_task.name = nil
      expect(daily_task).to be_valid
    end
    
    it '名前が空文字の場合、有効であること' do
      daily_task.name = ''
      expect(daily_task).to be_valid
    end    
  end

  # 関連のテスト
  describe '関連' do
    it 'userに属していること' do
      expect(daily_task.user).to eq(user)
    end

    it '複数のタスクログを持っていること' do
      task_log1 = create(:task_log, daily_task: daily_task)
      task_log2 = create(:task_log, daily_task: daily_task)
      expect(daily_task.task_logs).to include(task_log1, task_log2)
    end
  end
end
