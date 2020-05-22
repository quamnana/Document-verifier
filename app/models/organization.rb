class Organization < ApplicationRecord
	# Adding frienly_id to enhance SEO
	extend FriendlyId
	friendly_id :name, use: :slugged

# Association between the user model through the membership model
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
# Association between the template model
	has_many :templates, dependent: :destroy
# Association between the category model
	has_many :categories
# Association between the template model	
	belongs_to :owner, class_name: "User", foreign_key: "user_id"

	# Validation
	validates :name, presence: true


end
