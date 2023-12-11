class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 belongs_to :clothe
 belongs_to :user
 has_many :comment, dependent: :destroy
 has_many :favorite, dependent: :destroy

 has_many :post_tags, dependent: :destroy
 has_many :tags, through: :post_tags

 attr_accessor :post_tags_attributes

before_validation :tags_count_check
after_save :tag_set

validates :text, presence: true

def tags_count_check
  tag_names = self.post_tags_attributes.values.map{|o|o['tag_name']}.reject(&:blank?)
  #byebug
  if tag_names.blank?
    errors.add(:base, "タグは1つ以上入れてください")
  end
end

def tag_set
  old_tag_names = self.tags.pluck(:name)
  tag_names = self.post_tags_attributes.values.map{|o|o['tag_name']}.reject(&:blank?)
  reject_tag_names = old_tag_names - tag_names
  new_tag_names = tag_names - old_tag_names

  new_tag_names.each do |tag_name|
    tag = Tag.find_or_create_by(name: tag_name)
    self.post_tags.find_or_create_by(tag_id: tag.id)
  end
  reject_tag_names.each do |tag_name|
    tag = Tag.find_by(name: tag_name)
    if tag.post_tags.size <= 1
      tag.destroy if tag
    else
      post_tag = tag.post_tags.find_by(post_id: self.id)
      post_tag.destroy if post_tag
    end
  end
end

 #accepts_nested_attributes_for :tags, allow_destroy: true

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
   old_tags.each do |old_name|
     self.tags.delete Tag.find_by(tag_name:old_name)
   end

   # 新しいタグを保存
   new_tags.each do |new_name|
     post_tag = Tag.find_or_create_by(tag_name:new_name)
     self.tag << tag
   end
 end

 def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("text LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("text LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end