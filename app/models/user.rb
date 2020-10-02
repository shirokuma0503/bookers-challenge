class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image #プロフィール画像投稿ができるようにする

  has_many :books, dependent: :destroy #Bookモデルと1：N

end
