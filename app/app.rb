require 'sinatra/base'
require 'json'
require_relative 'models/listings'
require "open-uri"

class EtsyJson < Sinatra::Base

  get '/price' do
    listings = Listings.new
    listings.price.to_s
  end

  get '/quantity' do
    "Quantity"
  end

  get '/materials' do
    "Materials"
    listings = Listings.new
    listings.material_ranking.to_s
  end

  get '/tags' do
    "Tags"
    listings = Listings.new
    listings.tag_ranking.to_s
  end

  get '/categories' do
    "Categories"
    listings = Listings.new
    listings.category_ranking.to_s
  end

end
