require 'json'
require_relative '../app/lib/calculator.rb'

describe Calculator do
  file = File.read('data.txt')
  mock_data = JSON.parse(file)['results']

  describe 'price calculator' do
    it 'calculates the correct average of the prices' do
      expect(subject.average(mock_data, 'price')).to eq(56)
    end

    it 'calculates the correct minimum price' do
      expect(subject.minimum(mock_data, 'price')).to eq(0)
    end

    it 'calculates the correct maximum price' do
      expect(subject.maximum(mock_data, 'price')).to eq(350)
    end

    it 'calculates the correct average quantity' do
      expect(subject.average(mock_data, 'quantity')).to eq(4)
    end

    it 'calculates the correct minimum quantity' do
      expect(subject.minimum(mock_data, 'quantity')).to eq(0)
    end

    it 'calculates the correct maximum quantity' do
      expect(subject.maximum(mock_data, 'quantity')).to eq(12)
    end
  end
end
