class Category < ApplicationRecord
  # Validates a minimum name length of 4 characters & maximum name length of 30 chharacters
  validates :name, length: { in: 4..30 }, presence: true

  # Validates target user
  # 0 = Both, 1 = Ukrainian, 2 = Rest of the world
  validates :target_group, numericality: { only_integer: true }, presence: true
end
