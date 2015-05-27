class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.integer :user_id
      t.text :data

      t.timestamps
    end
    add_index :user_histories, [:user_id, :id]
  end
end

