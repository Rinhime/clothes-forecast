class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :clothe
 belongs_to :user
 has_many :comment, dependent: :destroy
 has_many :favorite, dependent: :destroy
 has_many :post_tag, dependent: :destroy
 has_many :tag, through: :post_tag
 
 def favorited_by?(user)
   favorite.exists?(user_id: user.id)
 end
 
 def save_tag(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
  # 現在取得したタグから送られてきたタグを除いてoldtagとする
   old_tags = current_tags - tags
   # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
   new_tags = tags - current_tags
   
   
   # 古いタグを消す
   old_tags.each do |old_tag_name|
     self.tags.delete Tag.find_by(tag_name:old_tag_name)
   end
   
   # 新しいタグを保存
   new_tags.each do |new_name|
     _tag = Tag.find_or_create_by(tag_name:new_tag_name)
     self.tags << tags
   end
 end
 
end