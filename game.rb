require_relative 'question'
require_relative 'player'

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def create_question
    @question = Question.new
  end

  def correct?(player_answer)
    @question.answer_correct?(player_answer)
  end
  
  def switch_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def winner
    @player1.lives > @player2.lives ? @player1 : @player2
  end
  
  def game_loop
    until game_over?
      puts "----- NEW TURN -----"
      create_question
      puts "#{@current_player.name}: #{@question.text}"
      print "> "
      player_answer = gets.chomp.to_i

      if correct?(player_answer)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      switch_turn
    end
  end
  
  def start
    game_loop
    puts "----- GAME OVER -----"
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Goodbye!"
  end


end
