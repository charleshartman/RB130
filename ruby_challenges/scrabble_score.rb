# scrabble_score.rb - Scrabble Score

# Write a program that, given a word, computes the scrabble score for that word.

=begin

Letter Values

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
Examples

"cabbage" should be scored as worth 14 points:

3 points for C
1 point for A, twice
3 points for B, twice
2 points for G
1 point for E
And to total:

3 + 2*1 + 2*3 + 2 + 1
= 3 + 2 + 6 + 3
= 5 + 9
= 14
=end

=begin --> PEDAC

problem/rules:
  - given an input string, determine the scrabble score but summing the
    appropriate value for each letter in the string
  - empty strings or nil input should return 0

input: string
output: integer (score of word)

data structure:
  - initialize (SCORING) constant
  - define class Scrabble
  - define instance method #score
  - define class method #score
  - define initialize with one parameter
    - clean string and assign to instance variable (word)

algorithm:
  - initialize (score) to 0
  - iterate through each character in string (upcase)
      - if (char) is key in SCORING
      - then add value from (SCORING) to (score)
  - return (score)

=end

class Scrabble
  SCORING = { "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4,
              "G" => 2, "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1,
              "M" => 3, "N" => 1, "O" => 1, "P" => 3, "Q" => 10, "R" => 1,
              "S" => 1, "T" => 1, "U" => 1, "V" => 4, "W" => 4, "X" => 8,
              "Y" => 4, "Z" => 10 }

  def initialize(input)
    @word = input.nil? ? '' : input.gsub(/\s/, '').upcase
  end

  def score
    score = 0
    @word.each_char { |char| score += SCORING[char] }
    score
  end

  def self.score(input)
    new(input).score
  end
end
