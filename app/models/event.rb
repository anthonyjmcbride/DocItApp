class Event < ApplicationRecord
  belongs_to :user

  def self.get_info(param)

    # EventBriteApi.create()
    # wrap_parameter format: [:json]
    # {"source_id": "source"}
      unless param.nil?
        query = param
      else
        query = "Miami"
      end
      res= EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
      {q: query }).event_getter
    end

    def info
      # makes use of self.source and self.source_id
      # as well as API wrapper in question
      # should return a hash
      # klasses = {
      #   "EventBriteApi":EventBriteApi
      # }s
      # klasses[???]

    end


  end




# @source = @event_brite_events.events.show(source: params[:event_source])
