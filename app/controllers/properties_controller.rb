class PropertiesController < ApplicationController
before_action :set_property, only: [:edit, :update]

before_action :authorize_user!, only: [:edit, :update]

  def new
    if params[:agent_id] && !Agent.exists?(params[:agent_id])
      redirect_to agent_path, alert: "Agent not found."
    else
      @property = Property.new(agent_id: params[:agent_id])
    end
  end

  def index
    @properties = Agent.find(session[:user_id]).properties
    if params[:date] == "This Week"
      @properties  = @properties.from_this_week
    elsif params[:date] == "This Month"
      @properties  = @properties.from_this_month
    end
    respond_to do |format|
       format.html
       format.json {render json: @properties}
     end
  end

  def show
    @properties = Agent.find(session[:user_id]).properties
    @property = Property.find_by_id(params[:id])
    if @property.nil?
      redirect_to(controller: 'properties', action: 'index')
    end
    if session[:user_id] != @property.agent_id
      redirect_to(controller: 'properties', action: 'index')
    end
    respond_to do |format|
       format.html
       format.json {render json: @property}
     end

  end

  def create
    agent = Agent.find_by(id: session[:user_id])
    @property = agent.properties.build(property_params)
    if @property.save
      render json: @property, status: 201
      #redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
    if params[:agent_id]
      @agent = Agent.find_by(id: params[:agent_id])
    end
  end

  def update
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_url
  end

  def next
    @property = Property.find(params[:id])
    @next_property = current_user.next_property(@property.id)
    if @next_property
      render json: @next_property
    else
      render json: current_user.properties.first
    end

  end

  private

  def property_params
    params.require(:property).permit(:address, :price, :bedrooms, :bathrooms, :agent_id, :client_id)
  end

  def authorize_user!
    if session[:user_id] != @property.agent_id
      redirect_to(controller: 'properties', action: 'index')
    end
  end

  def set_property
    @property = Property.find_by_id(params[:id])
    if @property.nil?
      redirect_to(controller: 'properties', action: 'index')
    end
  end
end
