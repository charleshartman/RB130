# exercise5.rb - Passing Parameters Part 3

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

gather(items) do |*food, last_food|
  puts food.join(', ')
  puts last_food
end

# => Let's start gathering food.
# => apples, corn, cabbage
# => wheat
# => We've finished gathering!
puts "\n---------------------------\n\n"

gather(items) do |apples, *food, wheat|
  puts apples
  puts food.join(', ')
  puts wheat
end

# => Let's start gathering food.
# => apples
# => corn, cabbage
# => wheat
# => We've finished gathering!
puts "\n---------------------------\n\n"

gather(items) do |apples, *food|
  puts apples
  puts food.join(', ')
end

# => Let's start gathering food.
# => apples
# => corn, cabbage, wheat
# => We've finished gathering!
puts "\n---------------------------\n\n"

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# => Let's start gathering food.
# => apples, corn, cabbage, and wheat
# => We've finished gathering!
