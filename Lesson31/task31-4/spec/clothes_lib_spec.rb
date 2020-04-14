# frozen_string_literal: true

require 'clothing_item'
require 'clothes_lib'

lib = ClothesLib.create_lib('./spec/fixtures/')

describe 'ClothesLib#create_lib' do
  let(:item) { lib.clothes_lib.first }

    it 'create objects correctly' do
      expect(item.name).to eq 'толстовка'
      expect(item.type).to eq 'торс'
      expect(item.temperature_range).to eq [10, 19]
    end

    it 'create instance of ClothesLib class' do
      expect(lib).to be_a_kind_of ClothesLib
    end

    it 'create all objects from dir' do
      expect(lib.clothes_lib.count).to eq 3
    end
  end


describe 'ClothesLib.types' do
  context 'when lib is not empty' do
    it 'get all types' do
      expect(lib.send(:types)).to contain_exactly('торс', 'головной убор', 'обувь')
    end
  end
end

describe 'ClothesLib.by_type' do
  let(:types) { lib.send(:types) }
  let(:array) { lib.send(:by_type, types) }

  context 'when lib is not empty' do
    it 'return sorted arrays' do
      expect(array[0].first.type).to eq 'торс'
      expect(array[1].first.type).to eq 'головной убор'
      expect(array[2].first.type).to eq 'обувь'
    end
  end
end

describe 'ClothesLib.match_clothes' do
  context 'when transferred matched temp' do
    let(:temp) { 15 }
    let(:result) { lib.match_clothes(temp) }

    it 'return matched obj' do
      expect(result[0].name).to eq 'толстовка'
      expect(result[1].name).to eq 'панама'
      expect(result[2].name).to eq 'слипоны'
    end
  end

  context 'when transferred not matched temp' do
    let(:temp) { -10 }
    let(:result) { lib.match_clothes(temp) }

    it 'return nil' do
      expect(result).to be_empty
    end
  end
end
