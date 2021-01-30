require 'rails_helper'
describe Sentence do
  before do
    @sentence = FactoryBot.build(:sentence)
  end

  describe '例文の作成' do
    context '例文の作成がうまくいく時' do
      it "user_id, content_idが存在し, english_textが英字で、japanese_textが日本語で存在すれば保存されること" do
        expect(@sentence).to be_valid
      end

      it "japanese_textが空でも保存できる" do
        @sentence.japanese_text = nil
        @sentence.valid?
      end
    end

    context ' 例文の作成がうまくいかない時' do
      it "english_textが空では保存できない" do
        @sentence.english_text = nil
        @sentence.valid?
        expect(@sentence.errors.full_messages).to include "英語のテキストを入力してください"
      end

      it "english_textが日本語では保存できない" do
        @sentence.english_text = "日本語"
        @sentence.valid?
        expect(@sentence.errors.full_messages).to include "英語のテキストは不正な値です"
      end
    end
  end
end