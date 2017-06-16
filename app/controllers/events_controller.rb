class EventsController < ApplicationController

  def index

    @event_brite_events = Event.get_info(params[:q])
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end


    def search
     @event_brite_events = Event.get_info(params[:q])
      respond_to do |format|
        format.json { render partial: 'list' }
    end

  end
end
