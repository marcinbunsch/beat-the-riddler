class User < ActiveRecord::Base

  has_many :guesses

  class << self
    def scoresheet
      where('admin IS NOT TRUE').all.map{|user| { :user_id => user.id, :name => user.username, :score => user.score }}.sort{ |a,b| b[:score] <=> a[:score] }
    end
  end

  def guessed?(puzzle)
    !Guess.where(:puzzle_id => puzzle.id, :user_id => self.id, :correct => true).empty?
  end

  def score
    Guess.where(:user_id => self.id, :correct => true).select('distinct(puzzle_id)').count
  end

  def guess_count_for_puzzle(puzzle)
    Guess.where(:puzzle_id => puzzle.id, :user_id => self.id).count
  end

  def level_access
    LevelAccess.new(self)
  end

end
