class Book < ApplicationRecord

    belongs_to :user #Userモデルと1：N

    validates :title, presence: true
    validates :body, presence: true,
              length: { maximum: 200 }

end
