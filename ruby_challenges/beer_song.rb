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
    - helper method (assigns)
      - (this) to argument (unless < 1, in which case 'No')
      - (next) to argument - 1 (unless < 1, in which case 'No')
    if this == 'No' then output custom (last) verse
=end
