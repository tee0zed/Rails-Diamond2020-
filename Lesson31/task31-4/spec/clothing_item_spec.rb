# frozen_string_literal: true

require 'clothing_item'
require 'clothes_lib'

item = ClothingItem.new(
    'шапка вязанная',
    'головной убор',
    [-25, 4])

describe 'ClothingItem.initialize' do
  context 'when args transferred' do
    it 'assign vars' do
      expect(item.name).to eq 'шапка вязанная'
      expect(item.type).to eq 'головной убор'
      expect(item.temperature_range).to eq [-25, 4]
    end
  end
end

describe 'ClothingItem.temp_match?' do
  context 'when transferred matched temp' do
    it 'true' do
      expect(item.temp_match?(-20)).to be true
    end
  end

  context 'when transferred not matched temp' do
    it 'false' do
      expect(item.temp_match?(10)).to be false
    end
  end
end

describe 'ClothingItem.to_s' do
  context 'when #to_s called' do
    it 'return correct string' do
      expect(item.to_s).to eq 'головной убор: шапка вязанная'
    end
  end
end
