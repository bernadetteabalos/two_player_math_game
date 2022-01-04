require_relative 'players'
require_relative 'questions'

class Game

  def start
    puts "Welcome to the game."
    player_creation
    play
    game_over
  end 

  def player_creation
    puts "Please enter the name of Player 1"
    @player_one = Player.new(gets.chomp)
    puts "Please enter the name of Player 2"
    @player_two = Player.new(gets.chomp)

    puts "Welcome #{@player_one.name} and #{@player_two.name}"

  end 

  def play 
    @turn = @player_one 
    until game_end?
      evaluate = new_round
      if !evaluate 
        @turn.wrong_answer
        puts 'Wrong answer. You lost a life!'
        score_tally
        puts "----- NEW TURN -----"
      else
        puts 'Right answer!'
        score_tally
        puts "----- NEW TURN -----" 
      end
    @turn = @turn == @player_one ? @player_two : @player_one  
    end 
  end 

  def new_round
    question = Question.new
    puts "#{@turn.name}: What is #{question.num1} + #{question.num2}?"
    answer = gets.chomp.to_i
    question.evaluate?(answer)
  end 

  def game_end?
    @player_one.lives == 0 || @player_two.lives == 0 
  end 

  def score_tally
    puts "#{@player_one.name}: #{@player_one.lives}/3 vs #{@player_two.name}: #{@player_two.lives}/3"
  end 

  def game_over
    score_tally
    winner = nil
    if @player_one.lives > 0
      winner = @player_one
    else
      winner = @player_two
    end

    puts "#{winner.name} wins with a score of #{winner.lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end 