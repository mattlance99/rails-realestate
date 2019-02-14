class PropertiesController < ApplicationController

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
  end

  def show
    if params[:agent_id]
      @property = Agent.find(params[:agent_id]).properties.find(params[:id])
    else
      @property = Property.find(params[:id])
    end
  end

  def create
    agent = Agent.find_by(id: session[:user_id])
    @property = agent.properties.build(property_params)
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
    if params[:agent_id]
      agent = Agent.find_by(id: params[:agent_id])
      if agent.nil?
        #redirect to edit page ? alert: "Agent not found."
      else
        @property = agents.posts.find_by(id: params[:id])
        #redirect to edit page ? alert: "Agent not found." if @post.nil?
      end
    else
      @property = Property.find(params[:id])
    end
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  def destroy
    Property.find(params[:id]).destroy
    redirect_to properties_url
  end

  private

  def property_params
    params.require(:property).permit(:address, :price, :bedrooms, :bathrooms, :agent_id)
  end
end
