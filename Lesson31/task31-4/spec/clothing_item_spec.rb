# encoding: utf-8

require 'clothing_item'
require 'clothes_lib'

describe ClothingItem do
  item = ClothingItem.new("шапка вязанная", "головной убор", [-25, 4])

  it 'ClothingItem#itintialize should assign vars correctly' do
    expect(item.name).to eq "шапка вязанная"
    expect(item.type).to eq "головной убор"
    expect(item.temperature_range).to eq [-25, 4]
  end

  it 'ClothingItem#temp_match? should return correct value' do
    expect(item.temp_match?(-20)).to eq true
    expect(item.temp_match?(10)).to eq false
  end

  it 'ClothingItem#to_s' do
    expect(item.to_s).to eq "головной убор: шапка вязанная"
  end
end
