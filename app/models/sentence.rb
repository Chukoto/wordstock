class Sentence < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :english_text, presence: true, format: { without: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :japanese_text, presence: false, format: { without: /\A[a-zA-Z\s]+\z/ }
end
