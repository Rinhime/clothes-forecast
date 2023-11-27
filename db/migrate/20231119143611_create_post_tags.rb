class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.string :tag_name, null: false

      t.timestamps
    end
  end
end
