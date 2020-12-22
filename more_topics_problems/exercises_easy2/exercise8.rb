# exercise8.rb - max_by

# The Enumerable#max_by method iterates over the members of a collection,
# passing each element to the associated block. It then returns the element
# for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should
# take an Array and a block, and return the element that contains the largest
# value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an
# argument, but must not use any other methods that iterate through an Array
# or any other collection.

# def max_by(arr)
#   result = []
#   arr.each { |ele| result << yield(ele) }
#   return nil if result.empty?
#   arr[result.index(result.max)]
# end

# better solution - student Herve
def max_by(array)
  max = nil
  array.each { |val| max = val if max.nil? || yield(val) > yield(max) }
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p (max_by([]) { |value| value + 5 }).nil?

=begin

problem/rules:
  - given an array and a block, return the value at the index that returns the
    greatest value when passed into the block

algorithm:
  - initialize RESULT array to []
  - iterate through given ARR and push the results of the block execution to
    the RESULT array
  - determine the index of the element of RESULT with the greatest value
  - return the value/element at that index in the original (given) array

=end
