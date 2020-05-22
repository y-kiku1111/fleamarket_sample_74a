require 'rails_helper'

describe User do
  describe '#create' do
    it 'is valid' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameがなければ登録出来ないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがなければ登録出来ないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "生年月日がなければ登録出来ないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "苗字がなければ登録出来ないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "苗字(ふりがな)がなければ登録出来ないこと" do
      user = build(:user, last_name_furigana: "")
      user.valid?
      expect(user.errors[:last_name_furigana]).to include("は不正な値です")
    end

    it "名前がなければ登録出来ないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "名前(ふりがな)がなければ登録出来ないこと" do
      user = build(:user, first_name_furigana: "")
      user.valid?
      expect(user.errors[:first_name_furigana ]).to include("は不正な値です")
    end

  end
end

