class PropertiesController < ApplicationController

  def new
    if params[:agent_id] && !Agent.exists?(params[:agent_id])
      redirect_to agent_path, alert: "Author not found."
    else
      @property = Property.new(agent_id: params[:agent_id])
    end
  end

  def index
    if params[:agent_id]
      @properties = Agent.find(params[:agent_id]).properties
    else
      @properties = Property.all
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
    @property = Property.new(property_params)
    @property.save
    redirect_to property_path(@property)
  end

  def edit
    @property = Property.find(params[:id])
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


  def property_params
    params.require(:property).permit(:address, :price, :bedrooms, :bathrooms, :agent_id)
  end
end
