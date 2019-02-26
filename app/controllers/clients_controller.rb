class ClientsController < ApplicationController

  def new
    @client = Client.new
    @client.properties.build
    @agent = current_user
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
    @client = Client.new(client_params)
    binding.pry
    if @client.save

      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to client_path(@client)
  end


  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :phone_number, properties_attributes:[:address, :price, :bedrooms, :bathrooms, :agent_id])
  end
end
