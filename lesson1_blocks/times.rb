# times.rb

# method implementation
def times(number)
  counter = 0
  while counter < number # do
    yield(counter)
    counter += 1
  end

  number
  # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5

# another method invocation
times(10) do |num|
  puts "The number #{num} multiplied by 5 is #{num * 5}."
end
