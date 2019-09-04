class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  before_create :add_abbreviation_from_name!

  has_one :manager
  accepts_nested_attributes_for :manager
  has_many :players
  accepts_nested_attributes_for :players
  def add_abbreviation_from_name!
    return if abbreviation

    abbreviation = name.upcase.split(' ')
    self.abbreviation = abbreviation.map(&:first).join('')
  end
end