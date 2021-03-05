class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_title, null: false
      t.string :category
      t.integer :level
      t.boolean :first_attempt

      t.timestamps
    end
  end
end
