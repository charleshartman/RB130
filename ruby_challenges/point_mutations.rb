# point_mutations.rb - Point Mutations

=begin --> PEDAC

problem/rules:
  - when comparing two strings of all UPPERCASE chars, determine how many
    characters are not the same at each idnetical index position
  - if one string is shorter, only compare up to the shorter length

input: string
output: integer (difference)

data structure:
  - class DNA, initialize with one string argument (dna1)
  - define (hamming_distance) method

algorithm:
  - initialize (result) to 0
  - convert dna1 and dna2 to arrays
  - iterate through each array comparing values at each index
    - if they do not have the same value then add 1 to (result)
    - break if either array's index + 1 is nil
    - add one to counter

=end

class DNA
  def initialize(dna1)
    @dna1 = dna1.chars
  end

  def hamming_distance(dna2)
    @dna2 = dna2.chars
    distance = 0
    @dna2.each_with_index do |marker, index|
      distance += 1 if marker != @dna1[index]
      break if @dna1[index + 1].nil?
    end
    distance
  end
end
