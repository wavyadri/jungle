require 'rails_helper'

RSpec.feature "Click Add To Cart", type: :feature, js: true do
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

  scenario "Add item to cart and cart counter increases by 1" do
    # ACT
    visit root_path
    page.all(".product button")[0].click

    # VERIFY
    within "nav" do
      expect(page).to have_content("My Cart (1)")
    end

    # DEBUG
    # save_screenshot

  end
end
