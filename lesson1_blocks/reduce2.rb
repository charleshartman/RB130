# reduce2.rb

def reduce(arr, num=0)
  acc = num

  arr.each { |n| acc = yield(acc, n) }

  p acc
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }              # => 15
reduce(array, 10) { |acc, num| acc + num }          # => 25
reduce(array) { |acc, num| acc + num if num.odd? }  # => NoMethodError...
