# encoding: utf-8

require 'film'
require 'film_lib'

describe FilmLib do
  library = FilmLib.new('./spec/fixtures/*')
  film = library.films.first

  it 'Film#initialize should do ok' do
    expect(film.title).to eq "Зеленая миля"
    expect(film.director).to eq "Фрэнк Дарабонт"
    expect(film.year).to eq "1999"
  end

  it 'Film#to_s should return correct string' do
    expect(film.to_s).to eq "Фильм: #{film.title}, Режиссер: #{film.director}, Год: #{film.year}"
  end
end
