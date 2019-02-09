class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]['info']['email']
      if agent = Agent.find_by(:email => oauth_email)

        session[:user_id] = agent.id
    else
      agent = Agent.find_by(email: params[:agent][:email])
      agent = agent.try(:authenticate, params[:agent][:password])
      return redirect_to(controller: 'sessions', action: 'new') unless agent
      session[:user_id] = agent.id
      @agent = agent
      redirect_to controller: 'welcome', action: 'home'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
