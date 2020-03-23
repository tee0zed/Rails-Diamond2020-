# encoding: utf-8

def sex(sex)
  case sex
  when 'man'
    'Дорогой,'
  when 'woman'
    'Дорогая,'
  else
    ':classified:'
  end
end

def greet_em(persons)
  persons.each do |person|
    puts <<~END

    ***
    #{sex(person[:sex])} #{person[:name]}
    тебе сегодня #{person[:age]}!
    #{person[:greeting]}

    END
  end
end

persons = [
{
  age: 18,
  sex: 'man',
  greeting: "Никакой водки в магазинах! Но в целом - с днём рождения.",
  name: "Гена"
},
{
  age: 30,
  sex: 'woman',
  greeting: "Хоть 30 и не 25, вы для нас ягодка опять!",
  name: "Прокофья Павловна"
},
{
  age: 42,
  sex: 'Yes please!',
  greeting: "Yeah, Baby!",
  name: "Остин Пауерз"
}]

greet_em(persons)
