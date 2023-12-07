require 'rails_helper'

RSpec.describe 'categories', type: :feature do
  let(:user) { User.create(name: 'Zelalem Yohannes', email: 'Zelalem@gmail.com', password: 'password') }
  let(:category) { Category.create(name: 'Category 1', icon: 'Icon', user_id: user.id) }
  let(:item) { Item.create(name: 'Item 1', amount: 100, author: user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    visit categories_path
  end

  context 'index page' do
    it 'displays the "Add Category" link' do
      expect(page).to have_link('Add New Category', href: new_category_path)
    end
  end

  context 'show page' do
    it 'displays the category details' do
      category.items << item

      visit category_path(category)
      expect(page).to have_content(category.name)
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.created_at.strftime('%d %b, %Y'))
      expect(page).to have_content(item.amount)

      # Add expectations for Total Amount
      total_amount = category.items.sum(&:amount)
      expect(page).to have_content("Total Amount: $#{total_amount}")
    end

    it 'show page displays the "Add Transaction" link' do
      visit category_path(category)

      expect(page).to have_link('Add Transaction', href: new_category_item_path(category))
    end

    it 'displays the list of items' do
      category.items << item

      visit category_path(category)

      # Add expectations for each item in the list
      category.items.each do |item|
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.created_at.strftime('%d %b, %Y'))
        expect(page).to have_content("$#{item.amount}")
      end
    end
  end
end
