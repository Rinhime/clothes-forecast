class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false, foreign_key: true
      t.timestamps
    end
    add_index :tag, :tag_name, unipue:true
  end
end
