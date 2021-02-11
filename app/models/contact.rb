class Contact < ApplicationRecord
	belongs_to :category

	validates :name, presence: true, uniqueness: true
end
