# encoding: utf-8

def vowels_and_consonants_count(string)
  vowels = string.scan(/(?i)(?=[aeiouауоыиэяюёе])[a-zа-я]/).count
  consonants = string.scan(/(?i)(?=[^aeiouауоыиэяюёе])[a-zа-я]/).count

  puts "В этой строке #{vowels} гласных и #{consonants} согласных."
end

input = gets.strip

vowels_and_consonants_count(input)
