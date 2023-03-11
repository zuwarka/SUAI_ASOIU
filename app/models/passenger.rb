class Passenger < ApplicationRecord
  has_many :tickets, dependent: :destroy

  belongs_to :user

  scope :by_user, ->(user) { where(user_id: user.id) }
end
