class CreatePuzzlesSolveds < ActiveRecord::Migration
  def change
    create_table :puzzles_solveds do |t|
      t.integer :user_id
      t.integer :level
      t.integer :amount

      t.timestamps null: false
    end
  end
end
