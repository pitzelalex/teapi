class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  enum status: %w[Cancelled Active]
end
