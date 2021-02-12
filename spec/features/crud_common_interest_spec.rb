require 'rails_helper'

RSpec.feature 'CommonInterests CRUD', type: :feature do
  let(:common_interest_name) { 'Scuba Diving' }

  context 'Create CommonInterest' do
    scenario 'valid inputs' do
      visit new_common_interest_path
      fill_in 'Name', with: common_interest_name
      click_on 'Create Common interest'
      visit common_interests_path
      expect(page).to have_content(common_interest_name)
    end

    scenario 'invalid inputs' do
      visit new_common_interest_path
      fill_in 'Name', with: ''
      click_on 'Create Common interest'
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'Update CommonInterest' do
    scenario 'valid inputs' do
      common_interest = create(:common_interest, name: common_interest_name)
      updated_name = 'Ping Pong'

      visit edit_common_interest_path(common_interest)
      fill_in 'Name', with: updated_name
      click_on 'Update Common interest'
      expect(page).to_not have_content(common_interest_name)
      expect(page).to have_content(updated_name)
    end
  end

  context 'Delete CommonInterest' do
    scenario 'success' do
      common_interest = CommonInterest.create!(name: common_interest_name)
      visit common_interests_path
      expect(page).to have_content(common_interest_name)
      visit edit_common_interest_path(common_interest)
      click_on 'Destroy'
      visit common_interests_path
      expect(page).not_to have_content(common_interest_name)
    end
  end
end
