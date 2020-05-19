class User < ApplicationRecord
# Association with the template model
	has_many :templates, dependent: :destroy

  has_many :created_organizations, class_name: "Organization"

# Association between the organization model through the membership model
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
  



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	
	

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
end
