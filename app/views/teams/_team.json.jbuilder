json.extract! team, :id, :name, :abbreviation, :created_at, :updated_at
json.set! :manager do
  json.set! :first_name, team&.manager&.first_name
  json.set! :last_name, team&.manager&.last_name
  json.set! :age, team&.manager&.age
end
json.set! :players do
  json.array! team.players do |player|
    json.extract! player, :name, :age
  end
end
json.url team_url(team, format: :json)
