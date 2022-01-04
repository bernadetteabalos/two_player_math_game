require './players'

def player_creation
  puts "Please enter the name of Player 1"
  player_one = Player.new(gets.chomp)
  puts "Please enter the name of Player 2"
  player_two = Player.new(gets.chomp)

  puts "Welcome #{player_one.name} and #{player_two.name}"

end 

player_creation