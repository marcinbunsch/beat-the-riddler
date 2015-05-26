class LevelAccess < Struct.new(:team)

  def can_access?(level)
    return true if level == 1
    count = get_count_for(level-1)
    score = get_score_for(level-1)
    score >= count
  end

  def get_count_for(level)
    counts[level] || 0
  end

  def get_score_for(level)
    scores[level] || 0
  end

  def scores
    @scores ||= Puzzle.where(:id => guessed_puzzle_ids).group(:level).count
  end

  def counts
    @counts ||= Puzzle.group(:level).count
  end

  def guessed_puzzle_ids
    Guess.where(:team_id => team.id, :correct => true).select('distinct(puzzle_id)')
  end

end
