class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :clothe
 belongs_to :user
 has_many :comment, dependent: :destroy
 has_many :favorite, dependent: :destroy
 
 def favorited_by?(user)
   favorite.exists?(user_id: user.id)
 end
 
end