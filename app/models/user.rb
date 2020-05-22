class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  
# Association with the template model
	has_many :templates, dependent: :destroy

# Association with the organization model (In order to for to create organizations)
  has_many :created_organizations, class_name: "Organization"

# Association between the organization model through the membership model
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations on various fields
  validates :first_name, presence: true
	validates :last_name, presence: true
  validates :username, presence: true
	
  # Method to display the full name of a signed in user
  def full_name
    "#{first_name} #{last_name}"
  end

  
end
