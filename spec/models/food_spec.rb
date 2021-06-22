require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "料理の投稿" do
    before do 
     @user = FactoryBot.create(:user)
     @food = FactoryBot.build(:food)
    end

    context "料理の投稿が出来る" do

      it "情報を正しく入力すれば投稿できる" do
        expect(@food).to be_valid
      end

      it "料理の種類が2~5だと投稿できる" do
        @food.type_of_food_id = 3
        expect(@food).to be_valid
      end
    end

    context "料理の投稿ができない" do

      it "食べ物の名前が空だと投稿できない" do
        @food.name = ""
        @food.valid?
        expect(@food.errors.full_messages).to include("食べ物の名前を入力してください")
      end

      it "料理の手順が空だと投稿できない" do
        @food.ways = ""
        @food.valid?
        expect(@food.errors.full_messages).to include("手順を入力してください")
      end

      it "食材が空だと投稿できない" do
        @food.ingredients = ""
        @food.valid?
        expect(@food.errors.full_messages).to include("食材を入力してください")
      end

      it "料理の種類が空欄だと投稿できない" do
        @food.type_of_food_id = ""
        @food.valid?
        expect(@food.errors.full_messages).to include("料理の種類を入力してください", "料理の種類を選んでください")
      end

      it "料理の種類が1だと投稿できない" do
        @food.type_of_food_id = 1
        @food.valid?
        expect(@food.errors.full_messages).to include("料理の種類を選んでください")
      end

      it "料理の種類が文字の１だと投稿できない" do
        @food.type_of_food_id = "1"
        @food.valid?
        expect(@food.errors.full_messages).to include("料理の種類を選んでください")
      end

      it "画像が添付されてないと投稿できない" do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("画像ファイルを添付してください")
      end

      it "ユーザーが紐付いてないと投稿" do
        @food.user = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Userを入力してください")
      end
      
    end

  end
end
