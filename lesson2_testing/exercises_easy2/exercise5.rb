# exercise5.rb - drop_while

# The Enumerable#drop_while method begins by iterating over the members of a
# collection, passing each element to the associated block until it finds an
# element for which the block returns false or nil. It then converts the
# remaining elements of the collection (including the element that resulted
# in a falsey return) to an Array, and returns the result.

# Write a method called drop_while that behaves similarly for Arrays. It should
# take an Array as an argument, and a block. It should return all the elements
# of the Array, except those elements at the beginning of the Array that produce
# a truthy value when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every
# element, drop_while should return an empty Array.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
# for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

def drop_while(arr)
  result = []
  toggle = :off
  arr.each do |el|
    next if yield(el) && toggle == :off
    result << el
    toggle = :on
  end
  result
end

# rubocop: disable Lint/UnusedBlockArgument
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
# rubocop: enable Lint/UnusedBlockArgument

=begin

problem:
  - given an array, return a new array that includes all elements after and
    including the first element that evaluates to false when passed to the
    supplied block

algorithm:
  - iterate through array
    - if element evaluates to false, push it and the rest of the elements to
      new array (RESULT)
    - if it evaulates to true, go on to the next iteration
  - return (RESULT)

=end
