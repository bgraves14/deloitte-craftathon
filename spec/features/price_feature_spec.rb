require 'spec_helper'

feature "etsy price" do
  scenario 'a price route exists' do
    visit '/price'
    expect(page.status_code).to eq(200)
  end
end
