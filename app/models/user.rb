class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_type

  has_many :user_addresses
  has_many :addresses, through: :user_addresses

  has_many :favorite_places
  has_many :places, through: :favorite_places
end
