require 'httparty'
require 'json'

class EventbriteAPI

  def initialize(url, parameter)
    @url = url
    @parameter = parameter
  end

  def event_getter

    @result = HTTParty.get('https://www.eventbriteapi.com/v3/users/me/owned_events/',
    headers = {
        "Authorization": "Bearer XN4WWXR4UVKL4FA4LRXA",
    },
  end

end
# auth = {username: 'user', password: 'pass'}
#
# result = HTTParty.get(
#   "https://unicom24.ru/api/partners/requests/v1/locality/",
#   basic_auth: auth
# )
# 
#
#
#
# "https://www.eventbriteapi.com/v3/users/me/owned_events/",
#    headers = {
#        "Authorization": "Bearer SESXYS4X3FJ5LHZRWGKQ",
#    },

# HTTParty.post(
#   "https://www.acb.com/api/v2/market/LTC_BTC/",
#   :query => query,
#   :headers => headers
# )
