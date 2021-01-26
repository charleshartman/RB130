# scrabble_score.rb - Scrabble Score

=begin

Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider
the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

=end

=begin --> PEDAC

problem/rules:
  - given a string, return its scrabble score based on the score of each valid
    letter in the string

input: string (word)
output: integer (summed_score)

data structure:
  - define class Scrabble with one parameter (word)
  - define contructor #initialize with one parameter
    - assign @word to the return of #clean_string helper method
  - define constant (SCORING) hash dictionary
  - define instance method #score
  - define class method #score with one parameter
    - instantiates new Scrabble#score and passes argument

algorithm:
  - helper method should remove white space and non alpha characters and upcase
  - #score:
    - initialize (summed_score) to 0
    - iterate through chars of string, if included in hash key (array) then
      add hash value to (summed_scores)
    - return (summed_scores)
=end

class Scrabble
  attr_reader :word

  SCORING = { "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4,
              "G" => 2, "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1,
              "M" => 3, "N" => 1, "O" => 1, "P" => 3, "Q" => 10, "R" => 1,
              "S" => 1, "T" => 1, "U" => 1, "V" => 4, "W" => 4, "X" => 8,
              "Y" => 4, "Z" => 10 }

  def initialize(word)
    @word = word.nil? ? '' : word.gsub(/\s+/, '').upcase
  end

  def score
    word.chars.inject(0) { |sum, char| sum + SCORING[char] }
  end

  def self.score(word)
    new(word).score
  end
end
