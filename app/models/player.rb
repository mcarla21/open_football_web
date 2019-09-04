# frozen_string_literal: true

# this is the model
# that takes care of all actions related to players table
class Player < ApplicationRecord
  belongs_to :team
  validates :name, presence: :true
  validates :skill_level, presence: true
end
