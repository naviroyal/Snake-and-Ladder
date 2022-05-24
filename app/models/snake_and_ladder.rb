class SnakeAndLadder
  attr_accessor :players,:size,:no_of_dice,:snakes,:ladders
  
  def initialize(size = 100)
    @size = size
    @players = []
    @no_of_dice = 1
    @ladders = []
    @snakes = []
  end

  def setting_no_of_dices(no_of_dice)
    @no_of_dice = no_of_dice
  end

  def is_game_completed
    @players.size == 0
  end

  def print
    puts @size,@players,@no_of_dice
  end

end
 