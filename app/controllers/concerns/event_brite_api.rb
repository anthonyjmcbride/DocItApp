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

  def search(id)
    # Event.find(params[:source_id])
    Event.find_by("id")

    # finds event by id
  end
end
