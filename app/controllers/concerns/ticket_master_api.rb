require 'httparty'
require 'json'

class TicketMasterApi


  def ticketm_getter(data)
    @url = "https://app.ticketmaster.com/discovery/v2/events.curl?apikey="
    response = HTTParty.get(@url + "#{ENV['TICKET_API_KEY']}",keyword:data)
    JSON.parse(response.parsed_response)
  end
end
# https://api.meetup.com/find/events/?key=4e66244a1965777745f47742e3d5240
# https://app.ticketmaster.com/discovery/v2/events.json?apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4
