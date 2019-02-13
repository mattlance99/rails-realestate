class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

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

  def create
    agent = Agent.find_by(id: session[:user_id])
    @client = agent.client.build(client_params)
    if @property.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end


  def client_params
    params.require(:client).permit(:last_name, :first_name, :phone_number, :agent_id)
  end
end
