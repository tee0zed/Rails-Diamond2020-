# encoding: utf-8

email_regexp = /^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/i

puts 'Введите email:'
user_input = gets.encode('UTF-8').chomp

if user_input.match(email_regexp)
  puts 'Спасибо!'
else
  puts 'Это не email'
end
