require 'rails_helper'

RSpec.feature "Click on a product and see its details", type: :feature, js: true do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  
  scenario "They click on one product and redirect to the product's details" do
    # ACT
    visit root_path
    page.all(".product .actions a")[0].click
    # click_on('Details', :match => :first)

    # VERIFY
    expect(page).to have_css ".products-show"
    expect(page).to have_css("img[src*='apparel1.jpg']")

    # DEBUG
    # save_screenshot
    # puts page.html


  end
end
