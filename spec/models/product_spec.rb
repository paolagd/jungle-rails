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

      product = Product.create({ 
        quantity: 10,
        price: 1000,
        category: category
      })
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      category = Category.new()

      product = Product.create({ 
        name:  'Most comfortable tshirt ever',
        quantity: 10, 
        category: category
      }) 
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    
    it "is not valid without a quantity" do
      category = Category.new()

      product = Product.create({ 
        name:  'Most comfortable hat ever', 
        price: 1000,
        category: category
      }) 
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      category = Category.new()

      product = Product.create({ 
        name:  'Most comfortable sweater ever', 
        quantity: 10, 
        price: 1000, 
      })
      
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end