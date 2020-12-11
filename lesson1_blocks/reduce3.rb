# reduce3.rb

def reduce(arr)
  accumulator = '' if arr[0].class == String
  accumulator = [] if arr[0].class == Array
  accumulator = 0 if arr[0].class == Integer

  arr.each do |element|
    accumulator = yield(accumulator, element)
  end

  p accumulator
end

reduce(['a', 'b', 'c']) { |acc, value| acc + value }      # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
reduce([1, 2, 3, 4, 5]) { |acc, value| acc + value }      # => 15
