class Editmlike < ActiveRecord::Migration[6.1]
  def change
    add_index :mlikes, [:user_id, :micropost_id], unique: true
  end
end
