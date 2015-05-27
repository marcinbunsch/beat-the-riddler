class HistoriesController < ApplicationController
  before_filter :require_staff

  def show
    scope = UserHistory.includes(:user).limit(100).order('id DESC')
    if last_history_id = params[:last_history_id]
      scope = scope.where('id < ?', last_history_id)
    end
    @histories = scope
  end
end

