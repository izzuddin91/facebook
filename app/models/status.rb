class Status < ActiveRecord::Base
  # Remember to create a migration!
  has_many :profiles
  has_many :users, through: :profiles
end
