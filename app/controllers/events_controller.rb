class EventsController < ApplicationController

  def dashboard
    @current_user = User.find(1)
    @events = @current_user.events

  end

  def index
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

  def meetup
    params = {
      category: '1',
      city: 'Miami',
      # photo: '',
      country: 'US',
      status: 'upcoming',
      format: 'json',
      page: '25'
    }
    meetup_api = MeetupApi.new
    @meetup_events = meetup_api.open_events(params)
  end

  def create
    @current_user = User.find(1)
    event = @current_user.events.create(source: params[:event_source], source_id: params[:event_source_id])
    redirect_to dashboard_events_path()
  end

    def search
     @event_brite_events = Event.get_info(params[:q])
      respond_to do |format|
        format.json { render partial: 'list' }
    end
    # @meetup_events = meetup_api.open_events(params)
      #  respond_to do |format|
      #    format.json { render partial: 'list' }
  end
end
