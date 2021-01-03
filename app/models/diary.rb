class Diary < ApplicationRecord
  belongs_to :user

  validates :title, format: { without: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :text, format: { without: /\A[ぁ-んァ-ン一-龥]+\z/ }
end
