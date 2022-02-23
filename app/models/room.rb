class Room < ApplicationRecord
  has_many :room_users
  has_many :users, throgh: :room_users
end
