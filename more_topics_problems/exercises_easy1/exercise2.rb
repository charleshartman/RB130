# exercise2.rb - Optional Blocks

# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_further(arg='nothing')
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute_further(6) { |num| 5 + 1 + num } == 12
p compute_further('there') { |str| 'Hello ' + str } == 'Hello there'
p compute_further { |arg| "You passed me #{arg}, bro." } == \
  "You passed me nothing, bro."
p compute_further('yada') == 'Does not compute.'
