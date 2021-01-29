class Diary < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title, format: { with: /\A[\w\s!?,."'¥$%&]+\z/ }
    validates :text, format: { with: /\A[\w\s!?,."'¥$%&]+\z/ }
  end
end
