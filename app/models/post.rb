class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :clothe
 belongs_to :user
end
