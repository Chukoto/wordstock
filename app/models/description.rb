class Description < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :english_text, presence: true, format: { with: /\A[a-z0-9\s]+\z/ }
end
