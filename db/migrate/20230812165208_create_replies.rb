class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.references :confession, null: false, foreign_key: true
      t.string :result, null: false
      t.text :feedback, null: false

      t.timestamps
    end
  end
end
