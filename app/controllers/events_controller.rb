class EventsController < ApplicationController

  def index
<<<<<<< HEAD
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/", {q: 'Miami'}).event_getter

  end

=======
    @event_brite_events = EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
    {q: 'Miami'}).event_getter
  end

>>>>>>> dd7076d739019a4713a6f4863bc6f2ecfda4a9bf
end
