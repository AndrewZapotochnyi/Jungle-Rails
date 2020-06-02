# require 'rails_helper'

# RSpec.feature "AddToCarts", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name: 'Test Product',
        description: 'Test Description',
        quantity: 77,
        price: 3
      )
    end
  end

  # # DEBUG
  # save_screenshot

  scenario "clicking add to cart adds a product to the cart" do
    # ACT
    visit root_path

    click_on "Add"


    # VERIFY
    expect(page).to have_content("My Cart (1)")

    # DEBUG
    save_screenshot
  end
end