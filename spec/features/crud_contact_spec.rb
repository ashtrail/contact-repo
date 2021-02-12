require 'rails_helper'

RSpec.feature "Contacts CRUD", type: :feature do
  let(:contact_name) { 'Midoriya Izuku' }

  context "Create Contact" do
    before(:each) do
      create(:category, name: 'Friend')
      create(:category, name: 'Family')
    end

    scenario 'valid inputs' do
      visit new_contact_path
      fill_in 'Name', with: contact_name
      select('Family', from: 'contact[category_id]')
      click_on 'Create Contact'
      visit contacts_path
      expect(page).to have_content(contact_name)
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
      contact = create(:contact, name: contact_name)
      updated_name = 'Shigaraki Tomura'

      visit edit_contact_path(contact)
      fill_in 'Name', with: updated_name
      click_on 'Update Contact'
      expect(page).to_not have_content(contact_name)
      expect(page).to have_content(updated_name)
    end
  end

  context "Delete Contact" do
    scenario 'success' do
      contact = Contact.create!(name: contact_name, category: create(:category))
      visit contacts_path
      expect(page).to have_content(contact_name)
      visit edit_contact_path(contact)
      click_on 'Destroy'
      visit contacts_path
      expect(page).not_to have_content(contact_name)
    end
  end
end
