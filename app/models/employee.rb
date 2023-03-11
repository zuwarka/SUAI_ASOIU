class Employee < ApplicationRecord
  has_many :tickets, dependent: :destroy

  belongs_to :position

  delegate :name_position, to: :position
end
