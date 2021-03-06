class ApplicationController < ActionController::Base
  protect_from_forgery

  force_ssl if: :ssl_configured?

  before_filter :authenticate_user
  before_filter :ensure_team
  before_filter :store_user_history

  def authenticate_user
    find_user
    redirect_to '/login' unless @current_user
  end

  def find_user
    @current_user = LoginUserFinder.new(session[:user_id]).find
  end

  def current_user
    @current_user
  end
  helper_method :current_user

  def require_staff
    redirect_to "/" unless current_user.staff?
  end

  def ssl_configured?
    !(Rails.env.development? || Rails.env.test?)
  end

  def is_staff?
    current_user && current_user.staff?
  end

  def ensure_team
    if current_user and current_user.team_id.nil?
      redirect_to "/join"
    end
  end

  def store_user_history
    return unless current_user
    return if current_user.respond_to?(:ignore_in_history) and current_user.ignore_in_history?
    UserHistory.create({
      :user_id => current_user.id,
      :data => params.to_json
    })
  end

end
