# encoding: utf-8

class Equalizer
  attr_accessor :diplomats

  def initialize(diplomats)
    @diplomats = diplomats
  end

  def calculate
    diff = diff(rub_values)
    to_s(result(diff))
  end

  private

  def result(diff)
    diff.map.with_index { |val, indx| val / diplomats[indx].rate }
  end

  def rub_values
    diplomats.map { |dipl| dipl.rate * dipl.amount }
  end

  def diff(rub_values)
    mean = rub_values.sum / diplomats.size
    diff = rub_values.map { |value| value - mean }
    diff.reject { |value| value.abs < 2 }
  end

  def to_s (results)
    to_buy = "Вам надо купить:"
    to_sell = "Вам надо продать:"

    if results.size < 2
      return "Портфели сбалансированы, редкая удача."
    end

    results.each_with_index do |value, indx|
      if value < 0
        to_buy << "\n #{diplomats[indx].sym}: #{value.abs.round(2)}"
      else
        to_sell << "\n #{diplomats[indx].sym}: #{value.abs.round(2)}"
      end
    end
    to_sell << "\n"
    to_buy << "\n"
  end
end
