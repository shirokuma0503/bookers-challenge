class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  attachment :profile_image #プロフィール画像投稿ができるようにする

  has_many :books, dependent: :destroy #Bookモデルと1：N

  validates :introduction, length: { maximum: 50 }

end
