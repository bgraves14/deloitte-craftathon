require "open-uri"
require "json"

class EtsyData

  def get_data
    key = ENV["ETSY_KEY"]
    url = "https://openapi.etsy.com/v2/listings/active?api_key=" + key
    JSON.parse(open(url).read)
  end
end
