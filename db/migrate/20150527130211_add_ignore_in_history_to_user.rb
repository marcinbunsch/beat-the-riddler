class AddIgnoreInHistoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :ignore_in_history, :boolean, :default => false
  end
end
