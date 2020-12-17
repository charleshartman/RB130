# exercise5.rb - Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Write a program that deciphers and prints each of these names.

def decode(str)
  rot13 = ''
  str.each_char do |char|
    val = char.ord
    rot13 <<  if val.between?(65, 77) || val.between?(97, 109) then val + 13
              elsif val.between?(78, 90) then (64 + (13 - (90 - val))).chr
              elsif val.between?(110, 122) then (96 + (13 - (122 - val))).chr
              else char
              end
  end
  rot13
end

def coded_names(input_file)
  encoded = []

  File.open(input_file, "r") do |pioneer_log|
    pioneer_log.each_line do |name|
      encoded << name.chomp
    end
  end

  encoded
end

coded_names("input.txt")

p decode("Nqn Ybirynpr")

=begin --> PEDAC

problem/rules:
  -

input:
output:

data structure:

algorithm:
  -

=end
