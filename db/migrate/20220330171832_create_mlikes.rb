class CreateMlikes < ActiveRecord::Migration[6.1]
  def change
    create_table :mlikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
     
  end
end
