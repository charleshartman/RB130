# phone_number.rb - Phone Number

# Write a program that cleans up user-entered phone numbers so that they can
# be sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and
# use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a
# bad number
# If the phone number is more than 11 digits assume that it is a bad number

=begin --> PEDAC

problem/rules:
  - given a string as input, clean string and determine if it is a valid number
  - if valid, return cleaned string, if invalid, return ten '0' string

input: string
output: string

data structure:
  - define class PhoneNumber
  - define initialize that cleans number - #match(/\d/)
  - define instance method number to perform checks and return
  - define area_code to return first three digits of a ten digit number
  - define to_s to format number in (202) 111-1111 fashion

algorithm:
  - assign (number) by qualifying initial input (based on rules)
    - if any word characters then return (bad_num)
    - else clean (input) using regex
      remove everything but digits, if <10 or >11 then return (bad_num)
      if 11 and first char is not 1 then return (bad_num)
      if 11 and first char IS 1 then slice first char and return
      return result
  - area_code simply returns index 0..2 of (number)
  - to_s simply formats (number) by returning into string index slices
=end

# phone_number.rb

class PhoneNumber; end
