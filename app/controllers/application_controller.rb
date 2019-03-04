class ApplicationController < ActionController::Base
  before_action :require_logged_in

  def current_user
    @agent = Agent.find_by(id: session[:user_id])

  end

  def logged_in?
    if session[:user_id]
      current_user.id != nil
    end
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
end
