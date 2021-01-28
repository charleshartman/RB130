# exercise2.rb

# Add code/modify the code to such that the test method calls produce
# the results as shown in the comments (you cannot modify the test method
# definition or calls):

def test
  yield(2)
end

to_s = proc { |n| p n.to_i }
to_i = proc { |n| p n.to_s }

test(&to_s) # => 2
test(&to_i) # => "2"
