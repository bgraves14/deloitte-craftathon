feature "displaying the quantity" do
  scenario 'a quantity route exists' do
    visit '/quantity'
    expect(page.status_code).to eq(200)
  end
end
