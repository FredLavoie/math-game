require_relative './player'
require_relative './turn'

class Game

  def initialize
    @player1 = Player.new 'Player 1'
    @player2 = Player.new 'Player 2'
    @players = [@player1, @player2]
    @turn = Turn.new(@players)
  end

  def game_over?
    @players.select{|player| !player.dead?}.count == 1
  end

  def winner
    @players.find{|player| !player.dead?}
  end

  def end_game
    puts "~~~#{winner.name} has won!~~~"
    puts
    puts '------- GAME OVER -------'
    puts
  end

  def status
    puts '--------- Status ----------'
    puts "#{@player1.name}: #{@player1.lives} | #{@player2.name}: #{@player2.lives}"
  end

  def run
    until (game_over?) do
    puts "-------- Round ##{@turn.round} --------"
    current_player = @turn.get_current_player
    opponent = @turn.get_opponent(current_player)
    puts "Your turn #{current_player.name}"
    current_player.question
    status
    puts
    @turn.next_round
    end
    end_game
  end

end