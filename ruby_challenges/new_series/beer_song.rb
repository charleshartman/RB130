# beer_song.rb - Beer Song

# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

# -> answer updated from deprecated Beer Song challenge so no new PEDAC

class Verse
  def verse(bottles)
    case bottles
    when 3..99 then build_regular_verse(bottles)
    when 2 then build_low_verse(bottles)
    when 1 then single_bottle_verse
    when 0 then no_bottle_verse
    end
  end

  def verses(first, last)
    (last..first).to_a.reverse.inject('') do |str, num|
      str + verse(num) + "\n"
    end.chomp
  end

  def lyrics
    verses(99, 0)
  end

  private

  def build_regular_verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
    "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
  end

  def build_low_verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
    "Take one down and pass it around, #{n - 1} bottle of beer on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def no_bottle_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(num)
    Verse.new.verse(num)
  end

  def self.verses(num1, num2)
    Verse.new.verses(num1, num2)
  end

  def self.lyrics
    Verse.new.lyrics
  end
end
