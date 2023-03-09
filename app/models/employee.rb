class Employee < ApplicationRecord
  has_many :tickets

  belongs_to :position

  delegate :name_position, to: :position
end
