class Category < ApplicationRecord
	has_many :contact

	validates :name, presence: true, uniqueness: true
end
