class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :correct, null: false, default: 'no'

      t.timestamps
    end
  end
end
