class CreateClothes < ActiveRecord::Migration[6.1]
  def change
    create_table :clothes do |t|
      t.string :celsius, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
