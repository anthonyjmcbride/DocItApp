class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def dashboard
    @current_user = User.find(1)
    @events = @current_user.events
  end

  def index
    @event_brite_events = Event.get_info(params)
    @meet_up_events = Event.get_meetup_info(params)
  end

  def show
    # @event = params
    @current_user = User.find(1)
    @current_user.events.create(source: params[:event_source],source_id: params[:event_source_id],description: params[:event_description],photo: params[:event_photo],price: params[:event_price],date: params[:event_date])
    render json: params
    # id = params[:id]
    # @event = Event.find(1)
  end

  def sync_to_calendar
    # eventos_id = params[:id]
    # byebug
    # Event.where(source_id: params[:event_source_id])
  end

  def google_calendar_call
  end

def parse_event_info(response)
  # get info
  #return hash or Array
end

 def create
    @event = params
    @current_user = User.find(1)
    event = @current_user.events.create(source: params[:event_source],source_id: params[:event_source_id],description: params[:event_description],photo: params[:event_photo],price: params[:event_price],date: params[:event_date])
    redirect_to dashboard_events_path()
  end

  def search
    @event_brite_events = Event.get_info(params)
    respond_to do |format|
      format.json { render partial: 'list' }
    end
    # @meetup_events = meetup_api.open_events(params)
    #  respond_to do |format|
    #    format.json { render partial: 'list' }
  end

  def destroy

    @event.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_events_path(), notice: 'Your Dock Event was successfully destroyed.' }
      format.json { head :no_content }

    end
  end


end

private

def set_event
  @event = Event.find_by_id(params[:id])
end
