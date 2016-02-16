require 'sinatra/base'
require 'json'
require_relative 'models/listings'
require "open-uri"

class EtsyJson < Sinatra::Base

  get '/price' do
    listings = Listings.new
    listings.price.to_s
  end

end
