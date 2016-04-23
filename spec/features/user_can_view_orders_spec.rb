require "rails_helper"

RSpec.feature "User can view orders" do
  scenario "they see an order breakdown" do
    user = create_user

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    create_items

    item_1 = Item.first
    item_2 = Item.last

    visit items_path
    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    within(".card-#{item_2.id}") do
      click_button("Add to Cart")
    end

    visit cart_path
    click_on "Checkout"
    order = Order.first
    expect(page).to have_content("Your Orders")
    expect(page).to have_content(order.date.to_s)
  end
end