require_relative "calculator"
require 'money'
require 'json'
require 'money/bank/google_currency'
require_relative 'etsy-data'
Money.default_bank = Money::Bank::GoogleCurrency.new

class Listings
  include Calculator

  def price
    data = get_etsy_data
    get_values(data, 'converted_price')
  end

  def quantity
    data = get_etsy_data
    get_values(data, 'quantity')
  end

  private

  def get_values(data, field)
    {
      average: average(data, field),
      max: maximum(data, field),
      max_item: get_most_expensive_product(data, field),
      min: minimum(data, field),
      min_item: get_minimum_product(data, field)
    }.to_json
  end

  def get_etsy_data
    data = EtsyData.get_data
    convert_currency(data)
  end

  def convert_currency(data)
   data.each do |object|
     currency = object['currency_code']
     price = object['price'].to_i * 100
     money = Money.new(price, currency)
     money = money.exchange_to(:GBP).to_f
     object["converted_price"] = money
   end
  end
end
