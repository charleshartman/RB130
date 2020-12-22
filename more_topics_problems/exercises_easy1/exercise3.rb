# exercise3.rb - Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

def missing(arr)
  result = []
  (arr.first...arr.last).each do |num|
    result << num unless arr.include?(num)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# very cool other student solution:
# def missing(array)
#   (array.first..array.last).to_a - array
# end

=begin

input: array
output: array

data structure: arrays
rules:
  - given a sorted array of integers, return an array containing the missing
    integers between the lowest and highest given integers

algorithm:
  - identify LOWEST
  - identify HIGHEST
  - intialize new array
  - iterate through range of lowest to highest, if integer is present, next,
    else add to new_arr
  - return new array

=end
