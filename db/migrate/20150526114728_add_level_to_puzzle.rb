class AddLevelToPuzzle < ActiveRecord::Migration
  def change
    add_column :puzzles, :level, :integer, :default => 1, :null => false
  end
end
