class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.nickname = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  validates :nickname, presence: true

  has_one :profile
  has_many :diary
  has_many :contents
  has_many :descriptions
  has_many :sentences
  has_many :contents_histories, through: :contents
end
