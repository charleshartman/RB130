# beer_song.rb - Beer Song

# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

=begin --> PEDAC

problem/rules:
  -

input: int, or mult ints (splat)
output: string (verse) or multiple strings (verses) or entire song (lyrics)

data structure:
  - define class BeerSong
  - define verse (takes a single integer argument)
  - define verses (takes a splat argument... expands to array of ints)
  - define lyrics (returns entire song... so 1..99.to_a.reverse)
  - define custom method to convert int to string
      need conditional that converts 0 to "No"
      need conditional that outputs (last) verse

algorithm:
  - build (verse) method, accepts single integer argument and converts to string
    and interpolates info verse string
    - helper method (build_verse)
      - (this) to argument (unless < 1, in which case 'No')
      - (next) to argument - 1 (unless < 1, in which case 'No')
    if this == 'No' then output custom (last) verse
=end

class BeerSong
  def verse(bottles)
    case bottles
    when 3..99 then build_regular_verse(bottles)
    when 2 then build_low_verse(bottles)
    when 1 then single_bottle_verse
    when 0 then no_bottle_verse
    end
  end

  def verses; end

  def lyrics; end

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
