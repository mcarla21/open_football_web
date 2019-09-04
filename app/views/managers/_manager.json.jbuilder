json.extract! manager, :id, :first_name, :last_name, :age, :description, :created_at, :updated_at
json.set! :team do
  json.set! :id, manager.team.id
  json.set! :name, manager.team.name
end
json.url manager_url(manager, format: :json)
