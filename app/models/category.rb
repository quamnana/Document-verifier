class Category < ApplicationRecord
	# Adding frienly_id to enhance SEO
	extend FriendlyId
	friendly_id :name, use: :slugged
	
	has_many :templates
	belongs_to :organization

	# Validation
	validates :name, presence: true, length:{ minimum: 5 }
end
