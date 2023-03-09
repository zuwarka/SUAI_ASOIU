class Trip < ApplicationRecord
  has_many :tickets

  belongs_to :service_type
  belongs_to :train_type
  belongs_to :company

  delegate :name_service_type, to: :service_type
  delegate :name_train_type, to: :train_type
  delegate :name_company, to: :company

  scope :number_trip_asc, -> { order(:number_trip) }
end
