require "open-uri"
require 'json'

class EtsyData
  def self.get_data
    # key = ENV["ETSY_KEY"]
    # url = "https://openapi.etsy.com/v2/listings/active?api_key=" + "vzjrb7mtxwupfsahm6zhvv8m"
    # JSON.parse(open(url).read)['results']

    file = File.read('data.txt')
    mock_data = JSON.parse(file)['results']
  end
end
