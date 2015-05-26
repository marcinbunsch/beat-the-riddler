class AddTeamIdToGuess < ActiveRecord::Migration
  def change
    add_column :guesses, :team_id, :integer
  end
end
