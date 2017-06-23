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
  google_calendar_call
  byebug
  # if event has not been docked make API call to get events info
  headers = {Authorization: 'Bearer XN4WWXR4UVKL4FA4LRXA'}
  response = HTTParty.get('https://www.eventbriteapi.com/v3/events/'+params[:id], :headers => headers) # get info to push to Google calendar API
  #  info_to_google = parse_event_info(response)
    # # # find out which event is meant to be synched

    # # # grab the info from the api OR the database (depending on if they've dock'd it or not)
    # # # sync to google with some magic...
    Event.where(source_id: params[:event_source_id])
  end
def google_calendar_call

  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'

  require 'fileutils'
  byebug
  oob_uri = 'urn:ietf:wg:oauth:2.0:oob'
  application_name = 'Google Calendar API Ruby Quickstart'

  client_secrets_path = 'client_secret.json'
  credentials_path = File.join(Dir.home, '.credentials',
                               "calendar-ruby-quickstart.yaml")
  scope = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize
    FileUtils.mkdir_p(File.dirname(credentials_path))

    client_id = Google::Auth::ClientId.from_file(client_secrets_path)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: credentials_path)
    authorizer = Google::Auth::UserAuthorizer.new(
      client_id, scope, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(
        base_url: oob_uri)
      puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
      puts url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: oob_uri)
    end
    credentials
  end

  # Initialize the API
  service = Google::Apis::CalendarV3::CalendarService.new
  service.client_options = application_name
  service.authorization = authorize

  # Fetch the next 10 events for the user
  calendar_id = 'primary'
  response = service.list_events(calendar_id,
                                 max_results: 10,
                                 single_events: true,
                                 order_by: 'startTime',
                                 time_min: Time.now.iso8601)
 byebug
  puts "Upcoming events:"
  puts "No upcoming events found" if response.items.empty?
  response.items.each do |event|
    start = event.start.date || event.start.date_time
    puts "- #{event.summary} (#{start})"
  end
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
