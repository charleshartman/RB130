# test_tube.rb

def report(rolls)
  puts "You rolled: #{rolls}"
  puts "Dropping lowest roll...#{rolls.sort!.shift}"
  sleep 0.50
  puts "Your remaining rolls #{rolls} total: #{rolls.sum}."
end

def roll(roll_times, d_size)
  puts "Rolling #{roll_times}d#{d_size}..."
  # sleep 0.50
  rolls = []
  while roll_times > 0
    rolls << rand(1..d_size)
    yield(rolls.last) if block_given?
    roll_times -= 1
   # sleep 0.50
  end
  report(rolls)
end

def abilities
  # 6.times { roll(4, 6) { |last| puts "You rolled a #{last}." } }
  6.times { roll(4, 6) }
end

abilities

