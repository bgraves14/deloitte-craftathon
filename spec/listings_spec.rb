require_relative '../app/models/listings.rb'

describe Listings do
  let(:listings) { described_class.new }
  let(:output) { "[{\"max\":244,\"min\":0,\"average\":26}]" }

  # it("should return the price as a json") do
  #   expect(listings.price).to eq(output)
  # end
  #
  # it("should return the quantity as a json") do
  #   expect(listings.quantity).to eq(output)
  # end

end
