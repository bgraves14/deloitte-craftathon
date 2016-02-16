require 'spec_helper'

feature "etsy price" do
  scenario 'a price route exists' do
    visit '/price'
    expect(page.status_code).to eq(200)
  end

  scenario 'a quantity route exists' do
    visit '/quantity'
    expect(page.status_code).to eq(200)
  end

  scenario 'a materials route exists' do
    visit '/materials'
    expect(page.status_code).to eq(200)
  end

  scenario 'a tags route exists' do
    visit '/tags'
    expect(page.status_code).to eq(200)
  end

  scenario 'a categories route exists' do
    visit '/categories'
    expect(page.status_code).to eq(200)
  end

  scenario 'it shows the highest price' do
    visit '/price'
    expect(page).to have_content("245")
  end

end
