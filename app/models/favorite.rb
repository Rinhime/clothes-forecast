class Favorite < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: {scope: :post_id}

end
