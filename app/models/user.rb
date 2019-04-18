class User < ApplicationRecord
  has_many :tricks
  has_many :user_tricks, dependent: :destroy
  has_many :comments
  # has_many :bookmarks, through: :bookmarks, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
