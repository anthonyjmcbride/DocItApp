class Event < ApplicationRecord
  belongs_to :users

  def get_info
    # makes use of self.source and self.source_id
    # as well as API wrapper in question
    # should return a hash
    EventBriteApi.create(self.source)
  end
end

# TransportTruckAPI.create(self, self.user, self.company)

# event_getter method we created in the event_brite_api.rb file
