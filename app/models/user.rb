class User < ActiveRecord::Base

  belongs_to :team
  has_many :guesses

  def level_access
    if staff?
      StaffLevelAccess.new
    else
      LevelAccess.new(team)
    end
  end

end
