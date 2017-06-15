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

<<<<<<< HEAD
  def search(id)
    # Event.find(params[:source_id])
    Event.find_by("id")

    # finds event by id
  end
=======




>>>>>>> 2e61eff99bee47b8ac9739e202a4b2d99cac59af
end
