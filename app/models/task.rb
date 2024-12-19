class Task < ApplicationRecord
  enum status: [ :pending, :complete ]

  validates :title, :status, presence: true

  #defining start time for simple calendar
  def start_time
    self.due_date   
  end
end
