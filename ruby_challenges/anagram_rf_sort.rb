# anagrams_rf_sort.rb

class Anagram
  def initialize(key_str)
    @key_str = key_str.downcase
  end

  def match(input)
    list = filter_input(input)
    list.select { |str| str.downcase.chars.sort == @key_str.chars.sort }
  end

  private

  def filter_input(arr)
    arr.select { |str| str.downcase != @key_str.downcase }
  end
end
