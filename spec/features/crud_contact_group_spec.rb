require 'rails_helper'

RSpec.feature 'ContactGroups CRUD', type: :feature do
  let(:contact_group_name) { 'The Knights of the Round Table' }

  context 'Create ContactGroup' do
    scenario 'valid inputs' do
      visit new_contact_group_path
      fill_in 'Name', with: contact_group_name
      click_on 'Create Contact group'
      visit contact_groups_path
      expect(page).to have_content(contact_group_name)
    end

    scenario 'invalid inputs' do
      visit new_contact_group_path
      fill_in 'Name', with: ''
      click_on 'Create Contact group'
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'Update ContactGroup' do
    scenario 'valid inputs' do
      contact_group = create(:contact_group, name: contact_group_name)
      updated_name = 'Sunday Book Club'

      visit edit_contact_group_path(contact_group)
      fill_in 'Name', with: updated_name
      click_on 'Update Contact group'
      expect(page).to_not have_content(contact_group_name)
      expect(page).to have_content(updated_name)
    end
  end

  context 'Delete ContactGroup' do
    scenario 'success' do
      contact_group = ContactGroup.create!(name: contact_group_name)
      visit contact_groups_path
      expect(page).to have_content(contact_group_name)
      visit edit_contact_group_path(contact_group)
      click_on 'Destroy'
      visit contact_groups_path
      expect(page).not_to have_content(contact_group_name)
    end
  end
end
