class RankingsController < ApplicationController

  def show
    @scores = Team.scoresheet
  end
end
