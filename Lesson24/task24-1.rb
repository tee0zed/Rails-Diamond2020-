# encoding: utf-8

def time(times_show)
  times_show = ARGV[0].to_i unless ARGV[0].nil?

  times_show.times do
    puts Time.now
    sleep 1
  end
end

if ARGV[0].nil?
  puts "Введите сколько раз вы бы хотели вывести время, или просто нажмите \'enter\'"

  input = STDIN.gets.to_i
  input.zero? ? times_show = 10 : times_show = input
end

time(times_show)
