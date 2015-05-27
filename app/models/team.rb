class Team < ActiveRecord::Base
  has_many :users
  has_many :guesses

  class << self
    def scoresheet
      all.where('staff IS FALSE').map{|team| { :team_id => team.id, :name => team.name, :score => team.score }}.sort{ |a,b| b[:score] <=> a[:score] }
    end
  end

  def score
    Guess.where(:team_id => self.id, :correct => true).select('distinct(puzzle_id)').count
  end

  def guessed?(puzzle)
    !Guess.where(:puzzle_id => puzzle.id, :team_id => self.id, :correct => true).empty?
  end

  def guess_count_for_puzzle(puzzle)
    Guess.where(:puzzle_id => puzzle.id, :team_id => self.id).count
  end

end
