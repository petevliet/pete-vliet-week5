class EventsController < ApplicationController

  def index
  end

  def show
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to locations_path, notice: 'Event was successfully created.'
    end
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def update
  end

  def destroy
  end

  private
    def set_event
      Event.find(params[:event_id])
    end

    def event_params
      params.require(:event).permit(:description, :date, :requires_id)
    end



end
