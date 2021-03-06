class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path, notice: 'Location was successfully created.'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)

    redirect_to locations_path, notice: 'Location was successfully updated.'
  end

  def destroy
    @location = Location.find(params[:id])
    @location.events.destroy_all
    @location.destroy

    redirect_to @location, notice: 'Location and its event(s) were successfully destroyed.'
  end

  private
    def set_location
      Location.find(params[:location_id])
    end

    def location_params
      params.require(:location).permit(:name, :address, :zip_code)
    end


end
