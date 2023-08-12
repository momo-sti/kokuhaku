class CreateConfessions < ActiveRecord::Migration[7.0]
  def change
    create_table :confessions do |t|
      t.text :text, null: false

      t.timestamps
    end
  end
end
