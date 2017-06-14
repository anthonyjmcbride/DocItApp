class Event < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  include ActiveModel::Model
attr_reader :results
attr_accessor :query
validates :query, presence: true
def perform
  @event_brite_events
end
=======
  def get_info
    # makes use of self.source and self.source_id
    # as well as API wrapper in question
    # should return a hash
    klasses = {
      "EventBriteApi": EventBriteApi
    }
    # EventBriteApi.create()
    # wrap_parameter format: [:json]
    # {"source_id": "source"}
  end
>>>>>>> dd7076d739019a4713a6f4863bc6f2ecfda4a9bf
end

# TransportTruckAPI.create(self, self.user, self.company)

# event_getter method we created in the event_brite_api.rb file
