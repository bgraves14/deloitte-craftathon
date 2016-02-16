require_relative "calculator"
require 'money'
require 'money/bank/google_currency'
require_relative 'etsy-data'
Money.default_bank = Money::Bank::GoogleCurrency.new

class Listings
  include Calculator

  def price
    data = EtsyData.get_data
    convert_currency(data)
    average = average(data, 'converted_price')
    min = minimum(data, 'converted_price')
    max = maximum(data, 'converted_price')
    [max, min, average]
  end

  private


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
