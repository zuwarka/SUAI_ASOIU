class Passenger < ApplicationRecord
  has_many :tickets

  belongs_to :user

  scope :by_user, ->(user) { joins(:user).where(user_id: user.id) }
end
