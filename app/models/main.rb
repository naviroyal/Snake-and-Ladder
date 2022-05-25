require_relative 'snake_and_ladder'
require_relative 'player'
require_relative 'ladder'
require_relative 'snake'
require_relative 'dice'

class Main
    @game = SnakeAndLadder.new(100)
    @game.setting_no_of_dices(1)
    puts "Enter No. Of Players"
    num_of_players = gets.chomp.to_i

    num_of_players.times do |n|
      puts "Enter #{n+1} player Name"
      player = Player.new(gets.chomp,n+1)
      @game.players << player
      @game.player_place_mp[player.id] = 0
    end

    puts "Enter No. Of Snakes"
    num_of_snakes = gets.chomp.to_i

    num_of_snakes.times do |n|
      puts "Enter #{n+1} Snake Head and Tail"
      snake = Snake.new(gets.chomp.to_i,gets.chomp.to_i)
      @game.snakes << snake
    end

    puts "Enter No. Of Ladders"
    num_of_ladders = gets.chomp.to_i

    num_of_ladders.times do |n|
        puts "Enter #{n+1} Ladder Head and Tail"
        ladder = Ladder.new(gets.chomp.to_i,gets.chomp.to_i)
        @game.ladders << ladder
    end
    
    while(!@game.is_game_completed)
        dice = Dice.roll(@game.no_of_dice)
        @game.movePlayer(dice,@game.players[0])
        if @game.has_player_won(@game.players[0])
            puts "Player #{@game.players[0]&.name} won the game"
        else
          @game.players << @game.players[0]
        end
        @game.players.delete_at(0)
    end
end