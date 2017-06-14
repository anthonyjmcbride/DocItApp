require 'httparty'
require 'json'

class EventBriteApi

  def initialize(url, parameter={})
    @url = url
    @parameter = parameter
  end

  def event_getter
    response = HTTParty.get(@url,
      query: @parameter,
      headers: {
        "Authorization" => "Bearer #{ENV['EVENT_BRITE_KEY']}"
      }
    )
  end

  def show
    if search_params = params[:source_id] && params[:source_id][:query]
      @search = Search.new(query: search_params)
      @search.perform if @search.valid?
    else
      @search = Search.new
    end
  end
 #  def search(id)
 #  params.require(:source_id).permit(:name, :complete, :due_date, :term)
 # end

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
