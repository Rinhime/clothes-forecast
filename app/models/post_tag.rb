class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  attr_accessor :tag_name
end
