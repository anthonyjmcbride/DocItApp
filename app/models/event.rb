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
    # def self.get_ticket_info(params)
    #   @current_user = User.find(1)
    #   @location = @current_user.zipcode
    #       params[:text] = params[:q]
    #       # query = Hash.new
    #       # query['text'] = params[:text] if params[:text].present?
    #       # first load
    #     if params[:text].blank?
    #       query = @location
    #     else
    #       query = params[:text] +"%"+ params[:city]
    #     end
    #
    #     res= TicketMasterApi.new("https://api.meetup.com/find/events/?key=").ticketm_getter(query)
    #   end

      def self.get_ticket_info(params)
        @current_user = User.find(1)
        @location = @current_user.zipcode
            params[:city] = params[:q]
            # query = Hash.new
            # query['city'] = params[:city] if params[:city].present?
            # first load
          if params[:city].blank?
            query = "Miami"
          else
            query = params[:city] +"%"+ params[:city]
          end

    res= TicketMasterApi.new.ticketm_getter(query)
        end
end
# MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4&city=miami
# https://app.ticketmaster.com/discovery/v2/

# Examples
# Get a list of all events in the United States https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4
# Search for events sourced by Universe in the United States with keyword “devjam” https://app.ticketmaster.com/discovery/v2/events.json?keyword=devjam&source=universe&countryCode=US&apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4
# Search for music events in the Los Angeles area https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=324&apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4
# Get a list of all events for Adele in Canada https://app.ticketmaster.com/discovery/v2/events.json?attractionId=K8vZ917Gku7&countryCode=CA&apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4
#
# curl \
# --include 'https://app.ticketmaster.com/discovery/v2/events.json?size=1&apikey=MAPGpwLZjmR7v1hhu4cqAdlLAUPGdab4'
