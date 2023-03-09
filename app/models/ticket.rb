class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :trip
  belongs_to :employee

  # delegate :first_name, to: :passenger, prefix: :passenger
  # delegate :last_name, to: :passenger, prefix: :passenger
  # delegate :passport_id, :citizenship, to: :passenger
end
