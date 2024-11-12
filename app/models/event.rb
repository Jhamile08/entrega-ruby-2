class Event < ApplicationRecord
  belongs_to :user
  # validations

  validates :eventName, presence: true, length: { minimum: 3 }
  validates :level, presence: true,
                    inclusion: { in: %w[basic middle advance], message: "%<value>s isn't a correct level" }
  validates :descripcion, presence: true, length: { maximum: 500 }
  validates :date, presence: true

  self.table_name = 'event_infos'

  scope :by_level, ->(level) { where(level: level) if level.presence? }
  scope :by_exhibitor, ->(exhibitor) { where(exhibitor: exhibitor) if exhibitor.present? }
end
