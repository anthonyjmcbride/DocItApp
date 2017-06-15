class EventsController < ApplicationController

    def index

      @event_brite_events = Event.get_info(params[:q])

    end

    def search
    @event_brite_events = Event.get_info(params[:q])
      respond_to do |format|
        format.json { render partial: 'list' }
      end

    else
      query = "Miami"
    end
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",{q: query }).event_getter
    respond_to do |format|
      format.json { render 'list' }
    end
  end
