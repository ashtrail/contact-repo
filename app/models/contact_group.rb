class ContactGroup < ApplicationRecord
  has_and_belongs_to_many :contacts

  validates :name, presence: true, uniqueness: true

  def last_contact
    read_attribute(:last_contact) || 'N/A'
  end
end
