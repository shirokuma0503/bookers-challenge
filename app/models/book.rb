class Book < ApplicationRecord

    belongs_to :user #Userモデルと1：N

end
