# encoding: utf-8

require 'clothing_item'
require 'clothes_lib'

describe ClothesLib do
  pile = ClothesLib.create_lib('./spec/fixtures/')

  it 'ClothesLib#create_lib should create objects correctly' do
    obj = pile.clothes_lib.first

    expect(obj.name).to eq "куртка зимняя"
    expect(obj.type).to eq "торс"
    expect(obj.temperature_range).to eq [-15, -1]
  end

  it 'ClothesLib#create_pile should create instance of ClothesLib class' do
    expect(pile.class.name).to eq "ClothesLib"
  end

  it 'ClothesLib#initialize should get every ItemOfClothing instance from dir' do
    expect(pile.clothes_lib.count).to eq 14
  end

  it 'ClothesLib#types sould have all clothes types' do
    expect(pile.send(:types)).to eq ["торс", "обувь", "головной убор"]
  end

  it 'ClothesLib#by_type should return 3 arrays sorted by existing types' do
    types = ["торс", "обувь", "головной убор"]
    array = pile.send(:by_type, types)

    expect(array[0].map { |obj| obj.type }.uniq).to eq ["торс"]
    expect(array[1].map { |obj| obj.type }.uniq).to eq ["обувь"]
    expect(array[2].map { |obj| obj.type }.uniq).to eq ["головной убор"]
  end

  it 'ClothesLib#match_clothes should return only matched by given temperature ClothingItem objects' do
    temp = 15
    result = pile.match_clothes(temp)

    expect(result[0].name).to eq "толстовка"
    expect(result[1].name).to eq "слипоны"
    expect(result[2].name).to eq "панама"
  end
end

