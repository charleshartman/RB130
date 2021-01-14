# protein_translation - Protein Translation

# Lets write a program that will translate RNA sequences into proteins. RNA can
# be broken into three nucleotide sequences called codons, and then translated
# to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to
# Codons: "AUG", "UUU", "UCU"

# => which become a polypeptide with the following sequence =>
# Protein: "Methionine", "Phenylalanine", "Serine"

# There are 64 codons which in turn correspond to 20 amino acids; however, all
# of the codon sequences and resulting amino acids are not important in this
# exercise.

# There are also four terminating codons (also known as 'STOP' codons); if any
# of these codons are encountered (by the ribosome), all translation ends and
# the protein is terminated. All subsequent codons after are ignored, like this:

# RNA: "AUGUUUUCUUAAAUG" =>
# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# Note the stop codon terminates the translation and the final methionine is
# not translated into the protein sequence.--

# Below are the codons and resulting Amino Acids needed for the exercise.

# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP

=begin --> PEDAC

problem/rules:
  - return a list of proteins that correspond to the RNA sequence passed in as
    string
  - do not return any protein after a STOP protein
  - raise error if strand constains any invalid codons

input: string
output: string or array of strings depending on method called

data structure:
  - define class Translation
  - define class method #of_rna
  - define class method #of_codon
  - intialize constant to hash containing codons and corresponding aminos

algorithm:
  - #of_codon
    - lookup codon argument(s), push proteins to array, return first string in
      array
  - #of_rna
    - split sequence into array of codons:
      strand.split(/([A-Z]{3})/).select { |str| str.length == 3 }
    - raise error if sequence not valid (no keys present in split string)
    - lookup codon argument(s), push proteins to array, break if codon == STOP

=end

class Translation
  PROTEINS = { 'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'],
               'Leucine' => ['UUA', 'UUG'],
               'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
               'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
               'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA'] }

  def self.of_codon(*codons)
    protein = ''
    codons.each do |codon|
      PROTEINS.each { |k, v| protein = k if v.include?(codon) }
    end
    protein
  end
end
