class SnakeAndLadder
  attr_accessor :players,:size,:no_of_dice,:snakes,:ladders,:player_place_mp

  def initialize(size = 100)
    @size = size
    @players = []
    @no_of_dice = 1
    @ladders = []
    @snakes = []
    @player_place_mp = Hash.new
  end

  def setting_no_of_dices(no_of_dice)
    @no_of_dice = no_of_dice
  end

  def is_game_completed
    @players.size == 0
  end

  def movePlayer(dice_num,player)
    prev_pos = @player_place_mp[player&.id] 
    new_pos = prev_pos + dice_num
    puts "#{player&.name} #{prev_pos} #{new_pos} #{dice_num} -> "
    if new_pos > @size
      new_pos = prev_pos
    else
      @snakes.each do |snake|
        if snake.head == new_pos
          new_pos = snake.tail
        end
      end
      @ladders.each do |ladder|
        if ladder.head == new_pos
          new_pos = ladder.tail
        end
      end
    end
    @player_place_mp[player.id] = new_pos
  end

  def has_player_won(player)
    @player_place_mp[player.id]==@size
  end

  def is_game_completed
    @players.size()==0
  end

end
 