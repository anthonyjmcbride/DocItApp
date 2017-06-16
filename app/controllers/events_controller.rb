class EventsController < ApplicationController

  def index
    @event_brite_events = Event.get_info(params[:q])
  end

  def haha
    @event_brite_events = Event.get_info(params[:q])
  end

  def show
    @event = params
    @current_user = User.find(1)
    @current_user.events.create(source: params[:event_source], source_id: params[:event_source_id])
    render json: params
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
