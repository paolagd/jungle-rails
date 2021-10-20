require 'rails_helper'

RSpec.feature "Visitor adds item to shopping cart", type: :feature, js:true do
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

  scenario "They click on the Add button on a product and My Cart changes from 'My Cart (0)' to to 'My Cart (1)'" do
    visit root_path
 
    expect(page).to have_content('My Cart (0)')   

    find('button', text: 'Add' , match: :first).click
  
    expect(page).to have_content('My Cart (1)')   
  end
end
