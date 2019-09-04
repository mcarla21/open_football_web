json.extract! player, :id, :name, :skill_level, :created_at, :updated_at
json.set! :team do
  json.set! :id, player.team.id
  json.set! :name, player.team.name
end
json.url player_url(player, format: :json)
