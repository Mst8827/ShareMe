require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname,email,passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil) #factories>users.rbでnicknameが"abe"になっているため空に上書き
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil) #factories>users.rbでemailが"kkk@gmail.com"になっているため空に上書き。""の代わりに「nil」でもOK！
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "nicknameが9文字以上であれば登録できないこと" do
      user = build(:user, nickname: "123456789")
      user.valid?
      expect(user.errors[:nickname]).to include("は%{count}文字以内で入力してください")
    end

    it "nicknameが8文字以下であれば登録できること" do
      user = build(:user, nickname: "12345678")
      expect(user).to be_valid
    end

    it "重複したemailであれば登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以上であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は%{count}文字以内で入力してください")
    end
  end
end