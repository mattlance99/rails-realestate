class SessionsController < ApplicationController

  def new
  end

  def create
      @agent = Agent.find_by(username: params[:username])
      return head(:forbidden) unless @agent.authenticate(params[:password])
      session[:user_id] = @agent.id
    end

  def destroy
    session.delete :name
    redirect_to controller: 'application', action: 'hello'
  end

end
