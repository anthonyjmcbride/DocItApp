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
      if params[:q].blank?
        query = @location
      else
        query = params[:q] +"%"+ params[:city]
      end

      res= EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/",
      { q:query  }).event_getter
    end
  end
