# encoding: utf-8

token = ""

# Array where rand results will be stored.
char = []

# In ASCII table symbols from 48 to 57 refers to numbers
numbers = proc {rand(48..57)}

# from 65 to 90 to capital letters
capital_letters = proc {rand(65..90)}

# and symbols from 98 to 122 to lowercase letters.
lowercase_letters = proc {rand(97..122)}

8.times do
  # Filling array with rand results by calling procs
  char << numbers.call
  char << capital_letters.call
  char << lowercase_letters.call

  # pick one, transfer to symbol and concatenate it to a string.
  token << char.sample.chr

  # Clearing an array for next iteration.
  char.clear
end

puts token
