# frozen_string_literal: true

# this is the model
# that takes care of all actions related to teams table
class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  before_create :add_abbreviation_from_name!

  has_one :manager, dependent: :destroy
  accepts_nested_attributes_for :manager
  has_many :players,dependent: :destroy
  accepts_nested_attributes_for :players

  def add_abbreviation_from_name!
    return if abbreviation

    abbreviation = name.upcase.split(' ')
    self.abbreviation = abbreviation.map(&:first).join('')
  end
end