# exercise2.rb - Zipper

# The Array#zip method takes two arrays, and combines them into a single array
# in which each element is a two-element array where the first element is a
# value from one array, and the second element is a value from the second array,
# in order. For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation. It should
# take two Arrays as arguments, and return a new Array (the original Arrays
# should not be changed). Do not use the built-in Array#zip method. You may
# assume that both input arrays have the same number of elements.

def zip(arr1, arr2)
  result = []
  index = 0
  while index < arr1.size
    result << [arr1[index], arr2[index]]
    index += 1
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

=begin --> using each_with_index

def zipper(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << [element, array2[index]]
  end
  result
end

def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end

=end
