class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false, foreign_key: true
      t.timestamps
    end
    # タグ検索機能
    add_index :tags, :tag_name, unique:true
  end
end
