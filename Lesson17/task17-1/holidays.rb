# encoding: utf-8

time = Time.now

wday = time.wday

if wday == 0 || wday == 6
  puts "Сегодня выходной!"
  exit
end

file_path = __dir__ + "/data/holidays.txt"
file = File.new(file_path, "r:UTF-8")

holidays = file.readlines
file.close

for day in holidays
  day.chomp!
end

date = time.strftime("%d.%m")

if holidays.include?(date)
  puts "Сегодня государственный праздник"
else
  puts "Сегодня будний день, за работу!"
end
