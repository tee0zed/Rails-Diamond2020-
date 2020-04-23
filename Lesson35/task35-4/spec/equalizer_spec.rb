
require 'equalizer'
require 'currency_diplomat'

describe 'Equalizer.calculate' do
  context 'when equalized' do
    let(:diplomat1) { CurrencyDiplomat.new(
      1000,
      1,
      'RUB'
    )}

    let(:diplomat2) { CurrencyDiplomat.new(
     15.26,
     65.5,
     'USD'
    )}

    let(:session)  { Equalizer.new(
      [diplomat1, diplomat2]
    )}

    it 'should return "equalized"' do
      expect(session.calculate).to eq "Портфели сбалансированы, редкая удача."
    end
  end

  context 'when 2 currencies' do
    let(:diplomat1) { CurrencyDiplomat.new(
      500,
      1,
      'VAL1'
    )}

    let(:diplomat2) { CurrencyDiplomat.new(
      300,
      1,
      'VAL2'
    )}

    let(:session)  { Equalizer.new(
      [diplomat1, diplomat2]
    )}

    it 'equalize each to 400' do
      expect(session.calculate).to eq "Вам надо купить:\n VAL2: 100\nВам надо продать:\n VAL1: 100\n"
    end
  end

  context 'when 3 currencies' do
    let(:diplomat1) { CurrencyDiplomat.new(
      110,
      1,
      'VAL1'
    )}

    let(:diplomat2) { CurrencyDiplomat.new(
      70,
      1,
      'VAL2'
    )}

    let(:diplomat3) { CurrencyDiplomat.new(
      120,
      1,
      'VAL3'
    )}

    let(:session)  { Equalizer.new(
      [diplomat1, diplomat2, diplomat3]
    )}

    it 'equalize each to 100' do
      expect(session.calculate).to eq "Вам надо купить:\n VAL2: 30\nВам надо продать:\n VAL1: 10\n VAL3: 20\n"
    end
  end

  context 'when 4 currencies' do
    let(:diplomat1) { CurrencyDiplomat.new(
      140,
      1,
      'VAL1'
    )}

    let(:diplomat2) { CurrencyDiplomat.new(
      160,
      1,
      'VAL2'
    )}

    let(:diplomat3) { CurrencyDiplomat.new(
      130,
      1,
      'VAL3'
    )}

    let(:diplomat4) { CurrencyDiplomat.new(
      170,
      1,
      'VAL4'
    )}

    let(:session)  { Equalizer.new(
      [diplomat1, diplomat2, diplomat3, diplomat4]
    )}

    it 'equalize each to 150' do
      expect(session.calculate).to eq "Вам надо купить:\n VAL1: 10\n VAL3: 20\nВам надо продать:\n VAL2: 10\n VAL4: 20\n"
    end
  end
end

describe 'Equalizer#get_rate' do
  context 'when json not loaded' do
    let(:json) { nil }
    let(:name) { "USD" }
    it 'return nil' do
      expect(Equalizer.get_rate(name, json)).to eq nil
    end
  end

  context 'when no such valute' do
    let(:json) { Equalizer.load_json }
    let(:name) { "FOOBAR" }
    it 'return nil' do
      expect(Equalizer.get_rate(name, json)).to eq nil
    end
  end

  context 'when json loaded and valute is ok' do
    let(:json) { Equalizer.load_json }
    let(:name) { "USD" }
    it 'return rate' do
      expect(Equalizer.get_rate(name, json).class).to eq Float
    end
  end

  context 'when currency RUB and json loaded' do
    let(:json) { Equalizer.load_json }
    let(:name) { "RUB" }
    it 'return 1' do
      expect(Equalizer.get_rate(name, json)).to eq 1
    end
  end

  context 'when currency RUB and json not loaded' do
    let(:json) { nil }
    let(:name) { "RUB" }
    it 'return 1' do
      expect(Equalizer.get_rate(name, json)).to eq 1
    end
  end
end

