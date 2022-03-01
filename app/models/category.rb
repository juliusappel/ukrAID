class Category < ApplicationRecord
  # Validates a minimum name length of 4 characters & maximum name length of 30 chharacters
  validates :name, length: { in: 4..30 }, presence: true

  # Validates target user
  validates :target, numericality: { only_integer: true }, presence: true
end
