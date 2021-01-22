# anagram.rb - Anagrams

# Write a program that takes a word and a list of possible anagrams and selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists",
# "google", "inlets", and "banana", the program should return a list containing
# "inlets". Please read the test suite for the exact rules of anagrams.

=begin --> PEDAC

problem/rules:
  - given a string and a collection of strings, return the strings from the
    collection that are anagrams of the original single string argument
  - case sensitive

input: single string (word) and collection of strings (possible_anagrams)
output: array of strings that are anagrams

data structure:
  - define class Anagram
  - define #initialize with one parameter (word) - string
  - define #match with one parameter (possibles) - array

algorithm:
  - intialize (anagrams) to []
  - iterate through (possibles)
      if word converted to array and sorted is the same as possible converted
      to array and sorted:
      [word.chars.sort == possible.chars.sort 
        then add to (anagrams)]
  - return (anagrams)
=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    anagrams = []
    arr.each do |str|
      next if str.downcase == @word
      anagrams << str if str.downcase.chars.sort.join == @word.chars.sort.join
    end
    anagrams
  end
end
