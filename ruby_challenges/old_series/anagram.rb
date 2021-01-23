# anagrams.rb - Anagrams

# Write a program that, given a word and a list of possible anagrams, selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists"
# "google" "inlets" "banana" the program should return a list containing
# "inlets". Please read the test suite for exact rules of anagrams.

=begin --> PEDAC

problem/rules:
  - given an object instantiated with a given string, match any elements that
    are anagrams that that string from an array passed to a custom #match
    method and return and return the match(es) as a list

input: string, array of strings
output: array of one or more strings

data structure:
  - class Anagram defined with one parameter (key_string)
  - initialize method assigns passed string to instance variable
  - define #match method that takes array of strings and returns array of
    strings that are anagrams of the object's (key_string)

algorithm:
  - intialize (result) to []
  - iterate through given array of strings
    - if string is anagram of (key_string)
      - iterate through each char of given string
        - if all? char.count == (key_string).count(char)
          - then add string to (result)
  - return (result)

=end

class Anagram
  def initialize(key_str)
    @key_str = key_str
  end

  def match(input)
    result = []
    list = filter_input(input)

    list.each do |str|
      result << str if str.chars.all? do |c|
        str.downcase.count(c) == @key_str.downcase.count(c)
      end
    end
    result
  end

  private

  def filter_input(arr)
    arr.select do |str|
      str.length == @key_str.length && str.downcase != @key_str.downcase
    end
  end
end
