require_relative "calculator"
require_relative 'etsy-data'
require_relative "ranking"
require 'money'
require 'json'
require 'money/bank/google_currency'
Money.default_bank = Money::Bank::GoogleCurrency.new

class Listings
  include Calculator
  include Ranking

  def price
    get_values('converted_price')
  end

  def quantity
    get_values('quantity')
  end

  def materials
    get_ranking('materials')
  end

  def tags
    get_ranking('tags')
  end

  def categories
    get_ranking('category_path')
  end

  private

  def get_values(field)
    data = get_converted_etsy_data
    {
      average: average(data, field),
      max: maximum(data, field),
      max_item: get_most_expensive_product(data, field),
      min: minimum(data, field),
      min_item: get_minimum_product(data, field)
    }.to_json
  end

  def get_converted_etsy_data
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

  def get_ranking(field)
    data = EtsyData.get_data
    all_materials = all_objects(data, field)
    numbered_hash = map_to_hash all_materials
    sorted_array = sort_by_occurence numbered_hash
    cleaned_up_array = remove_occurences sorted_array
    most_popular_materials = most_popular cleaned_up_array
    items = most_popular_items(data, field, most_popular_materials)
    {
      most_popular_categories: most_popular_materials,
      most_popular_items: items
    }.to_json
  end
end
