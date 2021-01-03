# word_count.rb - Word Count

# Write a program that given a phrase can count the occurrences of each word
# in that phrase.

# For example, if we count the words for the input "olly olly in come free",
# we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

=begin --> PEDAC

problem/rules:
  - given a string with words, spaces, and symbols/puncuation, returh a hash
    dictionary with count of each word

input: string
output: hash

data structure:
  - class Phrase
  - define initialize with one parameter (input) and instance variable (words)
  - define (word_count) method

algorithm:
  - clean input string while converting to array, assign to instance variable
    (words) when intiializing
  - initialize (dictionary) hash with default value (0)
  - iterate through (words) adding each word to (dictionary) as key and
    incrementing value +1
  - return (dictionary)

=end

class Phrase
  def initialize(input)
    @words = input.downcase.scan(/\b[\w+']+\b/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, dictionary|
      dictionary[word] += 1
    end
  end
end
