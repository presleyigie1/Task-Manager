class Task < ApplicationRecord
  enum status: [ :pending, :complete ]

  validates :title, :status, presence: true
end
