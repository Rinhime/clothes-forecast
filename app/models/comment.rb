class Comment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :post
  belongs_to :user
  
  validates :comment_text, presence: true
  
end
