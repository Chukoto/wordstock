require 'rails_helper'
describe Diary do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日記作成' do
    context '日記作成がうまくいく時' do
      it "user_idが存在し, title, textが英字で入力されれば保存されること" do
        expect(@diary).to be_valid
      end
    end

    context '日記作成がうまくいかない時' do
      it "titleが存在しないと登録できない" do
        @diary.title = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include "タイトルを入力してください"
      end

      it "textが存在しないと登録できない" do
        @diary.text = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include "内容を入力してください"
      end
    end
  end
end