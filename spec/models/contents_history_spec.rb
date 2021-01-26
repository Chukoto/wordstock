require 'rails_helper'
describe ContentsHistory do
  before do
    @contents_history = FactoryBot.build(:contents_history)
  end

  describe '単語編集履歴の作成' do
    context '単語編集履歴の作成がうまくいく時' do
      it "user_id, content_id, wordが存在すれば保存されること" do
        expect(@contents_history).to be_valid
      end
    end
  end
end
