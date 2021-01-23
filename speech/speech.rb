# speech.rb

=begin --> PEDAC

problem/rules:
  - given a string, capitalize every other letter, starting with the 2nd letter,
    of every third word in the string
  - additionally, if any word is followed by puncuation, reverse the order of
    characters in that word

input: string
output: string

data structure:
  - define class Speech
  - define constructor #initialize with one parameter (str)
  - define instance method #your_method
  - define potential helper instance methods
    - #every_third
    - #every_second
    - #punc_follows_word

algorithm:
  - convert str to array of (words)
  - helper #every_third:
    - initialize counter to 2
    - iterate through array, while counter is <= the length of array
      convert #every_second char in that word to upper case
    - add 3 to counter
  - helper #every_second:
    - iterate through chars with index of given word, if chars index is odd,
      then upcase it
    - return word (joined if we converted to array)
  - punc_follows_word
    - iterate through words array
      - if word ends in puncuation then reverse chars 0..-2 and join
  - return words joined back into string

=end

class Speech
  attr_accessor :words

  def initialize(str)
    @words = str.split
  end

  def your_method
    result = []
    (0..words.length - 1).each do |x|
      result << ((x + 1) % 3 == 0 ? every_second(words[x]) : words[x])
    end

    result.map! do |word|
      word[-1].match?(/\.|,|!|\?/) ? punc_follows_word(word) : word
    end

    result.join(' ')
  end

  def every_second(word)
    word.chars
        .map!
        .with_index { |char, idx| idx.odd? ? char.upcase : char }
        .join
  end

  def punc_follows_word(word)
    word.capitalize.chars[0..-2].reverse.join + word[-1]
  end
end
