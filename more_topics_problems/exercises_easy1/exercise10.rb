# exercise10.rb - Count Items

# Write a method that takes an array as an argument, and a block that returns
# true or false depending on the value of the array element passed to it. The
# method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

# def count(arr)
#   result = 0
#   arr.each { |element| result += 1 if yield(element) }
#   result
# end

# def count(array)
#   result = 0
#   for element in array
#     result += 1 if yield(element)
#   end
#   result
# end

def count(arr)
  arr.select { |ele| yield(ele) }.size
end

# rubocop: disable Lint/UnusedBlockArgument
p count([1, 2, 3, 4, 5]) { |value| value.odd? } == 3
p count([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p count([1, 2, 3, 4, 5]) { |value| true } == 5
p count([1, 2, 3, 4, 5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
# rubocop: enable Lint/UnusedBlockArgument
