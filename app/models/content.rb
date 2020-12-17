class Content < ApplicationRecord

  with_options presence: true do
    validates :part_id, null: false
    validates :word
  end

end
