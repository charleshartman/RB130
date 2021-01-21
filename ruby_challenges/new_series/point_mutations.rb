# point_mutations.rb - Point Mutations

# Write a program that can calculate the Hamming distance between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying
# of a nucleic acid, in particular DNA. Because nucleic acids are vital to
# cellular functions, mutations tend to cause a ripple effect throughout the
# cell. Although mutations are technically mistakes, a very rare mutation may
# equip the cell with a beneficial attribute. In fact, the macro effects of
# evolution are attributable by the accumulated result of beneficial 
# microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

=begin --> PEDAC

problem/rules:
  - return the 'difference' between two strings of equal length, if lengths
    differ, then only compare up to the length of the shorter string
  - 'difference' is + 1 when characters at the same index position are not same

input:  object is instantiated with one string (strand), we call hamming 
        distance method and pass (second) string as argument to method for
        comparison
output: integer

data structure:
  - define class DNA
  - define #initialize with one parameter (strand)
  - define #hamming_distance to take one parameter (distance)

algorithm:
  - initialize result to 0
  - strand.size >= distance.size ? limit = distance.size : limit = strand.size
  - iterate through each index in (strand) upto limit - 1
    - if value at that index != value at that index of distance then add one
      to result
  - return result
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    result = 0
    shorter = strand.size >= distance.size ? distance.size : strand.size
    shorter.times do |index|
      result += 1 if strand[index] != distance[index]
    end
    result
  end

  private

  attr_reader :strand
end
