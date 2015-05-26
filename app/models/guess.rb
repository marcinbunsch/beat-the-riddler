class Guess < ActiveRecord::Base
  belongs_to :puzzle
  belongs_to :user
  belongs_to :team

  scope :solved, -> { where(:correct => true) }

  class << self
    def validate_answer(puzzle, guess, user)
      correct = puzzle.answer.to_s.downcase == guess.to_s.strip.downcase
      self.create!(:team_id => user.team_id, :user => user, :puzzle => puzzle, :correct => correct, :provided_answer => guess)
      correct
    end
  end
end
