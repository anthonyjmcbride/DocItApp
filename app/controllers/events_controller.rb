class EventsController < ApplicationController

  def index
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
    {q: 'Miami'}).event_getter
  end

end
