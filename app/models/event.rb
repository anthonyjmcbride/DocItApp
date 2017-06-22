class Event < ApplicationRecord
  belongs_to :user


  def self.get_info(params)

    @current_user = User.find(1)
    @location = @current_user.zipcode
      if params[:q].blank?
        query = @location
      else
        query = params[:q] +"%"+ params[:city]
      end

      res= EventBriteApi.new("https://www.eventbriteapi.com/v3/events/search/", { q:query }).event_getter
    end
    def self.get_meetup_info(params)
  
          params[:text] = params[:q]
          # first load
        if params[:text].blank?
          query = @location
        else
          query = params[:text]
        end
        res= MeetupApi.new("https://api.meetup.com/find/events/?key=").meetup_getter(query)
      end






  end
