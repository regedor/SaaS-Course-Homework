class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game) 
  raise WrongNumberOfPlayersError unless game.length == 2 
  raise NoSuchStrategyError unless game.map(&:last).all? {|s| s.size == 1 and "RPSrps".include? s}
  
  confront = game.map(&:last).join.downcase
  return game.last if %w{rp ps sr}.any? { |player_one_loss| confront == player_one_loss }
  return game.first
end

def rps_tournament_winner(games)
  rps_game_winner(games.first.first.is_a?(String) ?  games : [rps_tournament_winner(games.first), rps_tournament_winner(games.last)])  
end
#  Another Solution: begin ; rps_game_winner(games) ; rescue ; rps_game_winner([rps_tournament_winner(games.first), rps_tournament_winner(games.last)]) ; end

def combine_anagrams(words)
  words.group_by { |w| w.downcase.split(//).sort.join }.values
end


