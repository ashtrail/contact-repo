class Category < ApplicationRecord
  has_many :contacts

  validates :name, presence: true, uniqueness: true
end
