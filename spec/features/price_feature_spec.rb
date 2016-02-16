require 'spec_helper'

feature "etsy price" do
  scenario 'a price route exists' do
    visit '/price'
    expect(page.status_code).to eq(200)
  end


  scenario 'it shows the highest price' do
    visit '/price'
    expect(page).to have_content("244")
  end

end
