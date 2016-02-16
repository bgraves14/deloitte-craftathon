require 'sinatra/base'
require 'json'
require "open-uri"
require_relative 'models/listings'

class EtsyJson < Sinatra::Base

  @listings = Listings.new

  get '/:method' do
    listings = Listings.new
    listings.send(params[:method])
  end

  get '/*' do
    "not a root"
  end

end
