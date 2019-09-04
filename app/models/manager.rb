# frozen_string_literal: true

# this is the model
# that takes care of all actions related to managers table
class Manager < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  belongs_to :team
end
