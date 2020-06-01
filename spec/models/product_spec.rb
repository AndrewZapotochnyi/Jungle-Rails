require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # it 'should have a name' do
    #   @product = Product.new
    #   expect(@product.name).to be_present
    # end

    # it "doesn't save when there is no name" do
    #   category = Category.new(name: 'Test')
    #   product = Product.new(price: 1, quantity: 1, category: category)
    #   product.save
    #   expect(product.errors.full_messages).to include("Name can't be blank")
    # end

    it 'Saves' do
      category = Category.new(name: 'Test')
      product = Product.new(name: 'a', price: 1, quantity: 1, category: category)
      product.save
      expect(product).to be_valid
    end

    it "Doesn't save if there's no name" do
      category = Category.new(name: 'Test')
      product = Product.create(price: 1, quantity: 1, category: category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "Doesn't save if there's no price" do
      category = Category.new(name: 'Test')
      product = Product.create(name: 'a', quantity: 1, category: category)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "Doesn't save when there's no quantity" do
      category = Category.new(name: 'Test')
      product = Product.create(name: 'a', price: 1, category: category)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Doesn't save if there's no category" do
      product = Product.create(name: 'a', quantity: 1, price: 1)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end


  end
end