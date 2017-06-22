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
      @current_user = User.find(1)
      @location = @current_user.zipcode
          params[:text] = params[:q]
          # query = Hash.new
          # query['text'] = params[:text] if params[:text].present?
          # first load
        if params[:fields].blank?
          query = @location
        else
          query = params[:text] +"%"+ params[:city]
        end

        res= MeetupApi.new("https://api.meetup.com/find/events/?key=").meetup_getter(query)
      end






  end
