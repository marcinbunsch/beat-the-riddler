class RankingsController < ApplicationController
  def show
    @scores = User.scoresheet
  end
end
