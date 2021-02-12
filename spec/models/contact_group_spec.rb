require 'rails_helper'

RSpec.describe ContactGroup, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'last contact' do
    it 'has no value' do
      group = build(:contact_group, last_contact: nil)
      expect(group.last_contact).to eq('N/A')
    end
  end
end
