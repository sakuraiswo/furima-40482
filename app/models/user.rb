class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX,
                                 message: 'must include both letters and numbers and be in half-width characters.'
  validates :nickname, presence: true
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must consist of full-width characters only.' }
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[ァ-ヴ]+\z/, message: 'must consist of full-width Katakana characters only.' }
  validates :birthday, presence: true
end
