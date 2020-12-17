class Content < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :part

  with_options presence: true do
    validates :part_id, null: false
    validates :word
  end

end
