require 'rails_helper'

RSpec.feature 'Categories CRUD', type: :feature do
  let(:category_name) { 'Family' }

  context 'Create Category' do
    scenario 'valid inputs' do
      visit new_category_path
      fill_in 'Name', with: category_name
      click_on 'Create Category'
      visit categories_path
      expect(page).to have_content(category_name)
    end

    scenario 'invalid inputs' do
      visit new_category_path
      fill_in 'Name', with: ''
      click_on 'Create Category'
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'Update Category' do
    scenario 'valid inputs' do
      category = create(:category, name: category_name)
      updated_name = 'Professional'

      visit edit_category_path(category)
      fill_in 'Name', with: updated_name
      click_on 'Update Category'
      expect(page).to_not have_content(category_name)
      expect(page).to have_content(updated_name)
    end
  end

  context 'Delete Category' do
    scenario 'success' do
      category = Category.create!(name: category_name)
      visit categories_path
      expect(page).to have_content(category_name)
      visit edit_category_path(category)
      click_on 'Destroy'
      visit categories_path
      expect(page).not_to have_content(category_name)
    end
  end
end
