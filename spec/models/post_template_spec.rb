require 'rails_helper'

RSpec.describe PostTemplate, type: :model do
  it 'userが関連付けられている場合、有効であること' do
    user = create(:user)
    post_template = build(:post_template, user: user)
    expect(post_template).to be_valid
  end

  it 'userが関連付けられていない場合、無効であること' do
    post_template = build(:post_template, user: nil)
    expect(post_template).to_not be_valid
  end

  it 'contentがある場合、有効であること' do
    post_template = build(:post_template, content: 'テストコンテンツ')
    expect(post_template).to be_valid
  end

  it 'contentがない場合、無効であること' do
    post_template = build(:post_template, content: nil)
    expect(post_template).to_not be_valid
  end
end
