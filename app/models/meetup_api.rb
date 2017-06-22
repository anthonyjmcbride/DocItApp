require 'httparty'
require 'json'

class MeetupApi

  def initialize(url)
    @url = url
  end

  def meetup_getter(query)
    response = HTTParty.get(@url + "#{ENV['MEETUP_API_KEY']}",text: query

    )
  end


end
# https://api.meetup.com/find/events/?key=4e66244a1965777745f47742e3d5240
