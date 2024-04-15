class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/, message: '漢字かひらがなを使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'カタカナを使用してください' } do
    validates :last_name_katakana
    validates :first_name_katakana
  end
end
