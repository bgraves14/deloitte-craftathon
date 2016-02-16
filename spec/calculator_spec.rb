require 'json'
require_relative '../app/models/calculator.rb'

describe Calculator do
  file = File.read('data.txt')
  mock_data = JSON.parse(file)['results']
  let(:subject) { Class.new { extend Calculator}}

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

    it 'returns the cheapest item' do
      expect(subject.get_minimum_product(mock_data, 'price')).to eq(mock_data[2])
    end

    it 'returns the most expensive item' do
      expect(subject.get_most_expensive_product(mock_data, 'price')).to eq(mock_data[13])
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

    it 'returns the item with the lowest quantity' do
      expect(subject.get_minimum_product(mock_data, 'quantity')).to eq(mock_data[2])
    end

    it 'returns the item with the highest quantity' do
      expect(subject.get_most_expensive_product(mock_data, 'quantity')).to eq(mock_data[4])
    end
  end
end
