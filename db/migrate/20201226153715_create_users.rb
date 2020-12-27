class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password, null: false
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
