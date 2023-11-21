class Tag < ApplicationRecord
  has_many :post_tag, dependent: :destroy
  has_many :post, through: :post_tag
  
  validates :tag_name, presence:true, length:{maximum:20}
end