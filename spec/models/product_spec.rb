require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with valid attributes" do
      category = Category.new()

      product = Product.new({
        name:  'Most comfortable shoes ever',
        quantity: 10,
        price: 1000,
        category: category
      })
      expect(product).to be_valid  
    end

    it "is not valid without a name" do
      category = Category.new()

      product = Product.new({ 
        quantity: 10,
        price: 1000,
        category: category
      })
      expect(product).to_not be_valid  
    end

    it "is not valid without a price" do
      category = Category.new()

      product = Product.new({ 
        name:  'Most comfortable tshirt ever',
        quantity: 10, 
        category: category
      })
      expect(product).to_not be_valid  
    end
    
    it "is not valid without a quantity" do
      category = Category.new()

      product = Product.new({ 
        name:  'Most comfortable hat ever', 
        price: 1000,
        category: category
      })
      expect(product).to_not be_valid  
    end

    it "is not valid without a category" do
      category = Category.new()

      product = Product.new({ 
        name:  'Most comfortable sweater ever', 
        quantity: 10, 
        price: 1000, 
      })
      expect(product).to_not be_valid  
    end

  end
end