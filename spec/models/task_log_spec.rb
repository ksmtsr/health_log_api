require 'rails_helper'

RSpec.describe TaskLog, type: :model do
  let(:user) { create(:user) }
  let(:daily_task) { create(:daily_task, user: user) }

  it 'userが関連付けられている場合、有効であること' do
    task_log = build(:task_log, user: user, daily_task: daily_task)
    expect(task_log).to be_valid
  end

  it 'userが関連付けられていない場合、無効であること' do
    task_log = build(:task_log, user: nil, daily_task: daily_task)
    expect(task_log).to_not be_valid
  end

  it 'daily_taskが関連付けられている場合、有効であること' do
    task_log = build(:task_log, user: user, daily_task: daily_task)
    expect(task_log).to be_valid
  end

  it 'daily_taskが関連付けられていない場合、無効であること' do
    task_log = build(:task_log, user: user, daily_task: nil)
    expect(task_log).to_not be_valid
  end

  it 'completedがtrueの場合、有効であること' do
    task_log = build(:task_log, user: user, daily_task: daily_task, completed: true)
    expect(task_log).to be_valid
  end

  it 'completedがfalseの場合、有効であること' do
    task_log = build(:task_log, user: user, daily_task: daily_task, completed: false)
    expect(task_log).to be_valid
  end

  it 'completedがnilの場合、無効であること' do
    task_log = build(:task_log, user: user, daily_task: daily_task, completed: nil)
    expect(task_log).to_not be_valid
  end
end
