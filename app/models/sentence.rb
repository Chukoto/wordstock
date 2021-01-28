class Sentence < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :english_text, presence: true, format: { with: /\A[\s\w!?,."'¥$%&]+\z/ }
  validates :japanese_text, presence: false, format: { with: /\A[\s\p{blank}ぁ-んァ-ン一-龥。、・「」！？]+\z/ }
end
