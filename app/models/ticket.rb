class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :trip
  belongs_to :employee

  has_one :user, through: :passenger

  scope :by_user, ->(user) { joins(passenger: :user).where(user: { id: user.id }) }
end
