require 'rails_helper'

RSpec.feature "Visitor navigates to the product details page", type: :feature, js: true do
   
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

  scenario "They navigate to the product details by clicking on the product" do
    visit root_path

    find('a', text: 'Details' , match: :first).click 
    # save_and_open_screenshot 
      
    expect(page).to have_css '.products-show' 
  end
end
