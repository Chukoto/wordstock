class Description < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :english_text, presence: true, format: { with: /\A[\w\s!?,."'¥$%&]+\z/ }
end
