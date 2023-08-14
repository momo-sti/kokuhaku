class AddUsernameToConfessions < ActiveRecord::Migration[7.0]
  def change
    add_column :confessions, :username, :string
  end
end
