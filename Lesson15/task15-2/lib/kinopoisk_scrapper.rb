# encoding: utf-8

require 'nokogiri'
require 'open-uri'

module KinopoiskScrapper
  def films_from_site(number)
    return nil if number > 50
    page = Nokogiri::HTML.parse(open('https://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/50/'))

    data = page.css('tr.js-film-list-item>td.news')[0..number-1]

    data.map do |div|
      params = []
      params[0] = div.css('a.all').text
      params[1] = div.css('span').text[/\d+/]
      params[2] = div.css('a.lined').first.text

      Film.new(*params)
    end
    FilmLib.new(data)
  end
end