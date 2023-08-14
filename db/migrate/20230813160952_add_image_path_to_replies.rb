class AddImagePathToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :image_path, :string, null: false
  end
end
