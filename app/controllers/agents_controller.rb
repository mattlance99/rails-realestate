class AgentsController < ApplicationController

  def new
    @agent = Agent.new
  end

  def create
    Agent.create(agent_params)
    redirect_to agents_path
  end

  private

  def agent_params
    params.require(:agent).permit(:username, :password, :password_confirmation)
  end
end
