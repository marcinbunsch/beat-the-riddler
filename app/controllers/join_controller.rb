class JoinController < ApplicationController

  skip_before_filter :ensure_team

  def new

  end

  def create
    password = params[:password]
    if password and team = Team.where(password: password).take
      current_user.update_attribute(:team_id, team.id)
      flash[:notice] = "Welcome to #{team.name}!"
      redirect_to "/"
    else
      flash[:error] = "Password incorrect, please try again"
      redirect_to "/join"
    end
  end
end
