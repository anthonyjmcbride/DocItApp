class EventsController < ApplicationController

  def index
    @event_brite_events = Event.get_info(params[:q])
  end

  def haha
    @event_brite_events = Event.get_info(params[:q])
  end

  def show
    puts "****************************"
    puts params[:desc]
    puts "****************************"
    @event = params
    # id = params[:id]
    # @event = Event.find(1)
  end


    def search
     @event_brite_events = Event.get_info(params[:q])
      respond_to do |format|
        format.json { render partial: 'list' }
    end

  end
end
