class Trick < ApplicationRecord
    has_many :user_tricks, dependent: :destroy
    has_many :category_tricks, dependent: :destroy
    has_many :categories, through: :category_tricks
    has_many :comments, dependent: :destroy
end
