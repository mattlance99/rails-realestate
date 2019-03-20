class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def new
    @client = Client.new
    @client.properties.build
    @agent = current_user
  end

  def index
    @agent = Agent.find(session[:user_id])
    @clients = @agent.clients
    respond_to do |format|
       format.html
       format.json {render json: @clients}
     end
  end

  def show
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to client_path(@client)
  end

  private

  def client_params
    params.require(:client).permit(:last_name, :first_name, :phone_number, properties_attributes:[:address, :price, :bedrooms, :bathrooms, :agent_id])
  end

  def set_client
    @client = Client.find_by_id(params[:id])
    if @client.nil?
      redirect_to(controller: 'clients', action: 'index')
    end
  end
end
