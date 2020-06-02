# require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end


require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'


    @product =  @category.products.create!(
        name:  'Test Product',
        description: 'Test Description',
        quantity: 5,
        price: 9.99
      )

  end

  scenario "product link takes them to the products show page" do
    # ACT

    # binding.pry
    visit root_path
    # puts @product.name
    click_on @product.name

    # VERIFY
    expect(page).to have_content(@product.name) && have_css('section.products-show')

    # DEBUG
    save_screenshot
  end
end