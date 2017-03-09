class User < ApplicationRecord
  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
end
