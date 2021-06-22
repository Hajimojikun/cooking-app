require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User新規登録" do
    before do 
      @user = FactoryBot.build(:user)
    end
    context "User登録できる" do
      it "全ての情報を正しく入力すれば登録ができる" do
        expect(@user).to be_valid
      end
      
    end

    context "User登録できない" do
      it " nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it "Eメールが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "同じEメールは使用できない" do
        @user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it " passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it " passwordが５文字以内だと登録できない" do
        @user.password = "12"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください","パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "password(確認用)が空だと登録できない " do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "passwordとpassword(確認用)が一致してないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

    end
  end
end
