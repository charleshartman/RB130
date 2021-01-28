# exercise1.rb

# Modify the following code so it outputs the numbers as shown
# in the comments below:

def test2(block)
  array = [1, 2, 3]
  array.each do |n|
    block.call(n)
  end
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { |n| puts n }

# outputs :
# 1
# 1
# 2
# 3
# 2
