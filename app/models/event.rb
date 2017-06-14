class Event < ApplicationRecord
  belongs_to :user

  include ActiveModel::Model
attr_reader :results
attr_accessor :query
validates :query, presence: true
def perform
  @event_brite_events
end
end
