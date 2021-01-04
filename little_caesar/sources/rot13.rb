# rot13.rb

# ROT13 is a simple letter substitution cipher that replaces a letter with the
# letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar
# cipher.

# Create a function that takes a string and returns the string ciphered with
# Rot13. If there are numbers or special characters included in the string, they
# should be returned as they are. Only letters from the latin/english alphabet
# should be shifted, like in the original Rot13 "implementation".

CIPHER_LOWER = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n)
CIPHER_UPPER = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N)

def rot13(str)
  result = ''
  str.each_char { |char| result << plus13(char) }
  result
end

def decode13(str)
  result = ''
  str.each_char { |char| result << plus13(char) }
  result
end

def plus13(char)
  if ('a'..'z').include?(char)
    found = CIPHER_LOWER.find_index(char)
    return CIPHER_LOWER[found + 13]
  elsif ('A'..'Z').include?(char)
    found = CIPHER_UPPER.find_index(char)
    return CIPHER_UPPER[found + 13]
  else
    char
  end
end


p rot13("test") == "grfg"
p rot13("Test") == "Grfg"
p rot13("This is a secret message. It is ciphered. It is very secret. Thank you!")

p decode13("Guvf vf n frperg zrffntr. Vg vf pvcurerq. Vg vf irel frperg. Gunax lbh!")


# input: string
# output: string
# data structure: strings, each_char or maybe arrays

# rules:
# => take each character and return the character that comes 13 places after it
#    in the alphabet... this is like a circle, so at z the counter resets to 1
#    for letter a
# => uppercase and lowercase are both acceptable inputs
# => anything that is not a-z or A-Z should be returned without transformation

# info: a-z ordinals are 97..122, A-Z ordinals are 65-90
# algorithm:
# => initialize new variable to hold result (result)
# => iterate though each character in the given string
#    - define separate method to determine the character 13 positions to right
#      - take a letter, and add 13 to it's ordinal maxing at z/Z and starting
#        again from a/A
#      - for example, given char 't', if the ordinal value of the lowercase 
#        character subtracted from 122 is less than 13 then add the difference
#        to ordinal 96, else add 13 to the given ordinal. 
#      - for uppercase, replace those values with 90 and 64
# => append return to result string
#
