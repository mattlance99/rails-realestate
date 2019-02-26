class ApplicationController < ActionController::Base

  before_action :require_logged_in

    def current_user
      @agent = Agent.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user.id != nil
    end

    def require_logged_in
      return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end
end
