# reduce.rb
require 'pry'

def reduce(arr, acc=0)
  counter = 0

  while counter < arr.size
    acc = yield(acc, arr[counter])
    # binding.pry
    counter += 1
  end

  p acc
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }              # => 15
reduce(array, 10) { |acc, num| acc + num }          # => 25
reduce(array) { |acc, num| acc + num if num.odd? }  # => NoMethodError...
