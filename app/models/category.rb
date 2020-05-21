class Category < ApplicationRecord
	has_many :templates
	belongs_to :organization

	validates :name, presence: true, length:{ minimum: 5 }, uniqueness: true
end
