require 'rails_helper'

RSpec.describe User, type: :model do
  it "username 不能重複" do
    username = "hellokitty"
    create(:user, username: username)

    expect {
      create(:user, username: username)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "使用者可以登入" do
    user = create(:user, password: "12345678")

    user_data = {
      account: user.username,
      password: "12345678"
    }

    expect(User.login(user_data)).not_to be nil
  end

  it "註冊時密碼會加密" do
    user = create(:user, password: "12345678")
    expect(user.password.length).to be 40
  end
end
