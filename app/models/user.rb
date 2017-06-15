class User < ApplicationRecord
  has_many :events
  # users.password_hash in the database is a :string
  
end
