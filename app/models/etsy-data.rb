require "./keys"
require "open-uri"

class EtsyData

  url = "https://openapi.etsy.com/v2/listings/active?api_key=" + apikey
  def get_data
    JSON.load(open(url))
  end
end
