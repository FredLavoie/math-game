class Turn

  attr_reader :current_player
  attr_reader :opponent
  attr_accessor :round

  def initialize(players)
    @players = players
    @round = 0
    @current_player = nil
    @copponent = nil
  end

  

  def get_current_player
    @players.first
  end

  def get_opponent(current)
    @players.last
  end

  def next_round
    @current_player = get_current_player
    @opponent = get_opponent(@current_player)
    @round += 1
    @players.rotate!
  end

end
