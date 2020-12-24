class Description < ApplicationRecord
  validates :text, presence: true, format: { with: /\A[a-z0-9]+\z/ }
end
