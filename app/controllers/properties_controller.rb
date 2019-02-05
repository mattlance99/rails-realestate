class PropertiesController < ApplicationController

  def new
  end

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(address: params[:address], price: params[:price], bedrooms: params[:bedrooms], bedrooms: params[:bathrooms] )
    redirect_to property_path(@property)
  end
end
