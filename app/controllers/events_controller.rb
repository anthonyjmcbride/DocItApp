class EventsController < ApplicationController

  def index

    if params[:q].present?
      query = params[:q]
    else
      query = "Miami"
    end
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
    {q: query }).event_getter
  end
  def search
    if params[:q].present?
      query = params[:q]

    else
      query = "Miami"
    end
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",{q: query }).event_getter
    respond_to do |format|
      format.json { render 'list' }

    end


  end
end
