class PropertiesController < ApplicationController

  def new
    @property = Property.new
  end

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
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

  def property_params
    params.require(:property).permit(:address, :price, :bedrooms, :bathrooms)
  end
end
