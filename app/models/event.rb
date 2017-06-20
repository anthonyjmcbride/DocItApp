class Event < ApplicationRecord
  belongs_to :user


  def self.get_info(params)

    # makes use of self.source and self.source_id
    # as well as API wrapper in question
    # should return a hash
    # klasses = {
    #   "EventBriteApi":EventBriteApi
    # }
    # EventBriteApi.create()
    # wrap_parameter format: [:json]
    # {"source_id": "source"}
    @current_user = User.find(2)
    @location = @current_user.zipcode
      if params[:q].nil?
        query = 'Miami'
      else
        query = params[:q]
      end

      res= EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
      { q: query, "location": {
        "address": (params[:city].empty? ? 'Miami' : params[:city])
        }
      }).event_getter

    end

    def info
      # makes use of self.source and self.source_id
      # as well as API wrapper in question
      # should return a hash
      # klasses = {
      #   "EventBriteApi":EventBriteApi
      # }s
      # klasses[???]
# You get to choose the source, take a look at the hash in your Event model.
# The source_id changes based on the event you're trying to dock

    end
  end
