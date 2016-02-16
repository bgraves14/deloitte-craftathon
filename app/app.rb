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
  end

  get '/tags' do
    "Tags"
  end

  get '/categories' do
    "Categories"
  end

end
