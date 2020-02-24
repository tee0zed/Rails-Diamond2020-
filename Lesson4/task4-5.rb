# encoding: utf-8

puts "Давайте узнаем стоит ли идти сегодня ра работу..."

sleep 0.5

curr_time = Time.now

answer =
if curr_time.wday == 6 || curr_time.wday == 0
  "Сегодня выходной!"
else
  "Сегодня будний день, за работу!"
end

puts "\n#{answer}"
