require 'rails_helper'

RSpec.feature "Contacts CRUD", type: :feature do
  context "Create Contact" do
    before(:each) do
      create(:category, name: 'Friend')
      create(:category, name: 'Family')
    end

    scenario 'valid inputs' do
      visit new_contact_path
      fill_in 'Name', with: 'John Doe'
      select('Family', from: 'contact[category_id]')
      click_on 'Create Contact'
      visit contacts_path
      expect(page).to have_content('John Doe')
    end

    scenario 'invalid inputs' do
      visit new_contact_path
      fill_in 'Name', with: ''
      select('Family', from: 'contact[category_id]')
      click_on 'Create Contact'
      expect(page).to have_content("Name can't be blank")
    end
  end

  context "Update Contact" do
    scenario 'valid inputs' do
      initial_name = 'Midoriya Izuku'
      updated_name = 'Shigaraki Tomura'
      contact = create(:contact, name: initial_name)

      visit edit_contact_path(contact)
      fill_in 'Name', with: updated_name
      click_on 'Update Contact'
      expect(page).to_not have_content(initial_name)
      expect(page).to have_content(updated_name)
    end

    scenario 'invalid inputs' do
      contact = create(:contact)
      visit edit_contact_path(contact)
      fill_in 'Name', with: ''
      click_on 'Update Contact'
      expect(page).to have_content("Name can't be blank")
    end
  end
end