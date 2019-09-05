# frozen_string_literal: true

require 'csv'
namespace :csv do
  desc 'This task exports all teams with their manager and players in a csv file'
  task export_teams: :environment do
    rows = []
    headers = ['Team name', 'Team abbreviation', 'Manager name', 'Players name', 'Players skill level']
    rows << headers
    teams = Team.all
    teams.each do |team|
      first_row_for_team = [team.name, team.abbreviation]
      manager =  team.manager.nil? ? '' : team.manager.first_name
      first_row_for_team << manager
      if team.players.empty?
        row = first_row_for_team << ['', '']
        rows << row
      else
        first = true
        team.players.each do |player|
          row = first ? first_row_for_team : ['', '', '']
          first = false
          row << player.name << player.skill_level
          rows << row
        end
      end
    end
    CSV.open('teams.csv', 'wb') do |csv|
      rows.each do |row|
        csv << row
      end
    end
  end
end
