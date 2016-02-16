require 'sinatra/base'
require 'json'
require_relative 'models/listings'
require "open-uri"

class EtsyJson < Sinatra::Base

  get '/price' do
    @listings = Listings.new
    listings.price.to_s
  end

  get '/quantity' do

  end

  get '/materials' do

  end

  get '/tags' do

  end

  get '/categories' do

  end

end
