class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    load_history if current_user.staff?
    return redirect_to '/' if !@user
  end

  def load_history
    offset = params[:last_history_id]
    scope = UserHistory.where(:user_id => @user.id).order('id DESC').limit(100)
    if offset
      scope = scope.where('id < ?', offset)
    end
    @history = scope
  end
end

