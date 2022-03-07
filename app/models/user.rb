class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  acts_as_favoritor
  acts_as_voter

  validates :username, :role, presence: true
  validates :username, uniqueness: true
  validates :role, numericality: { only_integer: true }
end
