class ClientsController < ApplicationController

  def index
    if params[:agent_id]
      @clients = Agent.find(params[:agent_id]).agent
    else
      @clients = Client.all
    end
  end

  def show
    @client = Client.find(params[:id])
  end
end
