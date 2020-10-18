class Book < ApplicationRecord

    belongs_to :user #Userモデルと1：N
    has_many :book_comments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true,
              length: { maximum: 200 }

end
