class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :clothe
 belongs_to :user
 has_many :comment, dependent: :destroy
 has_many :favorite, dependent: :destroy
 has_many :post_tag, dependent: :destroy
 has_many :tag, through: :post_tag
 
 # before_validation :downcase_tag_name
 # validates :tag_name, presence: true, uniqueness: { case_sensitive: false }
 
 def favorited_by?(user)
   favorite.exists?(user_id: user.id)
 end
 
 #検索メソッド、タイトルと内容をあいまい検索する
 def self.posts_serach(search)
   Post.where('text LIKE ?', "%#{search}%")
 end
 
 def save_posts(tag_list)
  # タグが存在していれば、タグの名前を配列として全て取得
   current_tags = self.tag.pluck(:tag_name) unless self.tag.nil?
  # 現在取得したタグから送られてきたタグを除いてoldtagとする
   old_tags = current_tags - tag
   # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
   new_tags = tag - current_tags
   
   
   # 古いタグを消す
   old_tags.each do |old_tag_name|
     self.tags.delete Tag.find_by(tag_name:old_tag_name)
   end
   
   # 新しいタグを保存
   new_tags.each do |new_tag_name|
     _tag = Tag.find_or_create_by(tag_name:new_tag_name)
     self.tag << tag
   end
 end
 
 # private

 #   def downcase_name
 #     self.tag_name = tag_name.downcase if name.present?
 #   end
 
end