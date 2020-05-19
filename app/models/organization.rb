class Organization < ApplicationRecord
# Association between the user model through the membership model
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	belongs_to :owner, class_name: "User", foreign_key: "user_id"

	validates :name, presence: true

end
