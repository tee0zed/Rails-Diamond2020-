require_relative "./lib/film"

films = [
  Film.new("Терминатор 2: Судный день", "Джеймс Кэмерон", 1991),
  Film.new("Жизнь других", "Флориан Хенкель фон Доннерсмарк", 2006),
  Film.new("Джокер", "Тодд Филлипс", 2019)
]

puts "Вот такие фильмы:"
films.each do |film|
  puts "#{film.title} (#{film.director}, #{film.year})"
end
