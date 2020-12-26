class Content < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :part

  with_options presence: true do
    validates :part_id, numericality: { other_than: 0 }
    validates :word, format: { with: /\A[a-z0-9]+\z/ }
  end

  belongs_to :user
  has_many :descriptions

end
