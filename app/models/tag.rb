class Tag < ApplicationRecord
  #has_many :post_tag, dependent: :destroy
  #has_many :post, through: :post_tag

  validates :name, presence:true, length:{maximum:20}

end
