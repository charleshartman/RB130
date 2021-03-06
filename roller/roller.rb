# roller.rb

class RollDice
  attr_reader :rolls, :sided, :result

  def initialize(rolls, sided)
    @rolls = rolls
    @sided = sided
    @result = []
  end

  def roll
    puts "\nRolling #{rolls}d#{sided}..."
    chance
    puts "You rolled: #{result}\n\n"
    self
  end

  def drop_and_sum
    puts "Dropping lowest roll and totaling..."
    sleep 0.75
    result.sort!.shift
    puts "Your total is #{result.sum}"
  end

  private

  def chance
    rolls.times { result << rand(1..sided) }
  end
end

# 6.times { RollDice.new(4, 6).roll.drop_and_sum }
# RollDice.new(1, 20).roll
# RollDice.new(4, 6).roll.drop_and_sum
# RollDice.new(1, 100).roll
6.times { RollDice.new(3, 6).roll }

