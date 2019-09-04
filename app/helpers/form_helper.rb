module FormHelper
  def setup_team(team)
    team.manager ||= Manager.new
    team.players = Array.new(3, Player.new) if team.players.empty?
    team
  end
end