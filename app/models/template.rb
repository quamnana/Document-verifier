class Template < ApplicationRecord
	# Adding frienly_id to enhance SEO
	extend FriendlyId
	friendly_id :name, use: :slugged

# Association with the user model
	belongs_to :user
	belongs_to :organization
	belongs_to :category
	
	# Validation on the various fields
	validates :name, presence: true
	validates :body, presence: true
	
end
