class Dice
  def self.roll(no_of_dice)
    1 + rand(6 * no_of_dice)
  end
end
