require_relative "calculator"
require_relative "ranking"
require 'money'
require 'money/bank/google_currency'
require_relative 'etsy-data'
Money.default_bank = Money::Bank::GoogleCurrency.new

class Listings
  include Calculator
  include Ranking

  def price
    data = EtsyData.get_data
    convert_currency(data)
    average = average(data, 'converted_price')
    min = minimum(data, 'converted_price')
    max = maximum(data, 'converted_price')
    [max, min, average]
  end

  def material_ranking
    data = EtsyData.get_data
    all_materials = all_objects(data, 'materials')
    numbered_hash = map_to_hash all_materials
    sorted_array = sort_by_occurence numbered_hash
    cleaned_up_array = remove_occurences sorted_array
    most_popular_materials = most_popular cleaned_up_array
    items = most_popular_items(data, 'materials', most_popular_materials)
    {most_popular_materials: most_popular_materials, most_popular_items: items}.to_json
  end

  def tag_ranking
    data = EtsyData.get_data
    all_materials = all_objects(data, 'tags')
    numbered_hash = map_to_hash all_materials
    sorted_array = sort_by_occurence numbered_hash
    cleaned_up_array = remove_occurences sorted_array
    most_popular_materials = most_popular cleaned_up_array
    items = most_popular_items(data, 'tags', most_popular_materials)
    {most_popular_tags: most_popular_materials, most_popular_items: items}.to_json
  end

  def category_ranking
    data = EtsyData.get_data
    all_materials = all_objects(data, 'category_path')
    numbered_hash = map_to_hash all_materials
    sorted_array = sort_by_occurence numbered_hash
    cleaned_up_array = remove_occurences sorted_array
    most_popular_materials = most_popular cleaned_up_array
    items = most_popular_items(data, 'category_path', most_popular_materials)
    {most_popular_categories: most_popular_materials, most_popular_items: items}.to_json
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
