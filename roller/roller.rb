# roller.rb

class RollDice
  attr_reader :rolls, :sided
  attr_accessor :result

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

  def chance
    rolls.times { result << rand(1..sided) }
  end

  def drop
    puts "Dropping lowest roll and totaling..."
    sleep 0.75
    result.sort!.shift
    puts "Your total is #{result.sum}"
  end
end

odin = RollDice.new(4, 6)
odin.roll.drop
