# encoding: utf-8

require 'film'
require 'film_lib'

describe FilmLib do
  library = FilmLib.new('./spec/fixtures/*')

  it 'FilmLib#get_films should have all films' do
    expect(library.films.count).to eq 3
  end

  it 'FilmLib#get_films should have only films' do
    expect(library.films.all? {|film| film.is_a? Film}).to be_truthy
  end

  it 'FilmLib#get_directors should get all film directors' do
    expect(library.directors).to eq ["Фрэнк Дарабонт", "Роберт Земекис"]
  end

  it '#get_random_film should get one random film, except chosen' do
    expect(library.get_random_film(1).is_a? Film).to be_truthy
    expect(library.get_random_film(1) != library.films[0]).to be_truthy
  end
end
