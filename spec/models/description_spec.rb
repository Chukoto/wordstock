require 'rails_helper'
describe Description do
  before do
    @description = FactoryBot.build(:description)
  end

  describe '意味の作成' do
    context '意味の作成がうまくいく時' do
      it "user_id, content_idが存在し, english_textが英字で存在すれば保存されること" do
        expect(@description).to be_valid
      end
    end

    context '意味の作成がうまくいかない時' do
      it "english_textが空では保存できない" do
        @description.english_text = nil
        @description.valid?
        expect(@description.errors.full_messages).to include "意味を入力してください", "意味は不正な値です"
      end

      it "english_textが日本語では保存できない" do
        @description.english_text = "日本語"
        @description.valid?
        expect(@description.errors.full_messages).to include "意味は不正な値です"
      end

      it "english_textに日本語が混ざっていると保存できない" do
        @description.english_text = "ジャパンglish"
        @description.valid?
        expect(@description.errors.full_messages).to include "意味は不正な値です"
      end
    end
  end
end