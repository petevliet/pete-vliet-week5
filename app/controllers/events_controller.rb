class EventsController < ApplicationController

  def index
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    @location = Location.find(params[:location_id])

    if @event.save
      redirect_to @location, notice: 'Event was successfully created.'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @location = Location.find(params[:location_id])

    redirect_to @location, notice: 'good job'
  end

  def destroy
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to location_path(@location), notice: 'Event was successfully destroyed.'
  end

  private
    def set_event
      Event.find(params[:event_id])
    end

    def event_params
      params.require(:event).permit(:description, :date, :requires_id)
    end



end
