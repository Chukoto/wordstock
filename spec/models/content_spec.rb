require 'rails_helper'
describe Content do
  before do
    @content = FactoryBot.build(:content)
  end

  describe '意味の作成' do
    context '意味の作成がうまくいく時' do
      it "user_idが存在し, part_id、wordが存在すれば保存されること" do
        expect(@content).to be_valid
      end
    end

    context '意味の作成がうまくいかない時' do
      it "part_idが0だと登録できない" do
        @content.part_id = 0
        @content.valid?
        expect(@content.errors.full_messages).to include "品詞を選択してください"
      end

      it "wordが空だと登録できない" do
        @content.word = nil
        @content.valid?
        expect(@content.errors.full_messages).to include "単語を入力してください", "単語は不正な値です"
      end

      it "wordがひらがな、カタカナ、漢字だと登録できない" do
        @content.word = "あア呼"
        @content.valid?
        expect(@content.errors.full_messages).to include "単語は不正な値です"
      end

      it "wordが大文字英字だと登録できない" do
        @content.word = "AAA"
        @content.valid?
        expect(@content.errors.full_messages).to include "単語は不正な値です"
      end

      it "part_idとwordの組み合わせが既に存在する場合は登録できない" do
        @content.save
        another_content = FactoryBot.build(:content)
        another_content.word = @content.word
        another_content.part_id = @content.part_id
        another_content.valid?
        expect(another_content.errors.full_messages).to include "品詞はすでに存在します"
      end
    end
  end
end