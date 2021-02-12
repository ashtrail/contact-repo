class Contact < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :common_interests
  has_and_belongs_to_many :contact_groups

  validates :name, presence: true, uniqueness: true
end
