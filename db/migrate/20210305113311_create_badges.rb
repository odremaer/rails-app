class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_title, null: false

      t.string :rule_type
      t.string :rule_parameter

      t.timestamps
    end
  end
end
