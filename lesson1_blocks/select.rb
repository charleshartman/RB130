# select.rb

def select(arr)
  new_arr = []
  counter = 0

  while counter < arr.size
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end

  p new_arr
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => []
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5]

select(array) do |num|
  num == 1 || num == 4
end
