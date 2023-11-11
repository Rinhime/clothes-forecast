class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_text, null: false
      t.string :user_id, null: false
      t.string :post_id, null: false
      t.timestamps
    end
  end
end
