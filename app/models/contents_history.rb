class ContentsHistory < ApplicationRecord
  belongs_to :user :through :content
  belongs_to :content
end
