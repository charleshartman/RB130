# exercise2.rb - Text Analyzer - Sandwich Code

# Fill out the rest of the Ruby code below so it prints output like that shown
# in "Sample Output." You should read the text from a simple text file that you
# provide. (We also supply some example text below, but try the program with
# your text as well.)

# This question requires that you read a simple text file. Try searching the Web
# for information on how to do this, and also take a look at the File class in
# the Ruby documentation. If you can't figure it out on your own, don't worry:
# just put the data directly into your program; an Array with one element per
# line would be ideal.

# Read the text file in the #process method and pass the text to the block
# provided in each call. Everything you need to work on is either part of
# the #process method or part of the blocks. You need no other additions
# or changes.

# The text you use does not have to produce the same numbers as the sample
# output but should have the indicated format.

class TextAnalyzer
  def process(what, count=0)
    File.open("sample_text.txt", "r") do |input_txt|
      input_txt.each_line do |line|
        count += yield(line)
      end
    end
    puts "#{count} #{what}"
  end
end

analyzer = TextAnalyzer.new
analyzer.process('paragraphs', 1) { |line| line == "\n" ? 1 : 0 }
analyzer.process('lines') { 1 }
analyzer.process('words') { |line| line.split.size }
