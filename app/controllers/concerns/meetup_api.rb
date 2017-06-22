require 'httparty'
require 'json'

class MeetupApi
  def initialize(url)
    @url = url
  end

  def meetup_getter(query)
    response = HTTParty.get(@url + "#{ENV['TICKET_API_KEY']}",city: "Miami")
    JSON.parse(response.parsed_response)
  end
end
# https://api.meetup.com/find/events/?key=4e66244a1965777745f47742e3d5240
