class Relationship < ApplicationRecord

    belongs_to :follower, class_name: "User" #Userモデルをフォローする人とされている人に分けている
    belongs_to :followed, class_name: "User"

end
