class SessionsController < ApplicationController

  def new
  end

  def create
    agent = Agent.find_by(email: params[:agent][:email])
    agent = agent.try(:authenticate, params[:agent][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless agent
    session[:user_id] = agent.id
    @agent= agent
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
