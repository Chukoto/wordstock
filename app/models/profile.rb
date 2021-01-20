class Profile < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { in: 1..200 }
end
