class AgentsController < ApplicationController
skip_before_action :require_logged_in


  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      session[:user_id] = @agent.id
      redirect_to controller: 'welcome', action: 'home'
    else
      render :new
    end
  end

  private

  def agent_params
    params.require(:agent).permit(:email, :password, :password_confirmation)
  end
end
