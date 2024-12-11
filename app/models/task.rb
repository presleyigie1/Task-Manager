class Task < ApplicationRecord
  enum status: [ :pending, :complete ]
end
