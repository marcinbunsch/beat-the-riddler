class AddStaffToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :staff, :boolean, :default => false
  end
end
