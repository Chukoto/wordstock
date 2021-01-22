require 'rails_helper'
describe Profile do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール作成' do
    context 'プロフィール作成がうまくいく時' do
      it "user_idが存在し, textが1文字以上200文字以内で入力されれば保存されること" do
        expect(@profile).to be_valid
      end
    end

    context 'プロフィール作成がうまくいかない時' do
      it "textが存在しないと登録できない" do
        @profile.text = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include "プロフィール文を入力してください", "プロフィール文は1文字以上で入力してください"
      end

      it "textが200文字以上だと登録できない" do
        @profile.text = Faker::Base.regexify("[aあ]{201}")
        @profile.valid?
        expect(@profile.errors.full_messages).to include "プロフィール文は200文字以内で入力してください"
      end
    end
  end
end
