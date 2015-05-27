class RankingsController < ApplicationController

  skip_before_filter :store_user_history

  def show
    @scores = Team.scoresheet
  end
end
