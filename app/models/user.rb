class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  validates :introduction, length: { maximum: 50 }

  attachment :profile_image #プロフィール画像投稿ができるようにする

  has_many :books, dependent: :destroy #Bookモデルと1：N
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(book_id)
      favorites.where(book_id: book_id).exists?
  end
  
end
