class Trick < ApplicationRecord
    validates :title, presence: true,length: {minimum: 5}
    has_many :user_tricks, dependent: :destroy
    has_many :category_tricks, dependent: :destroy
    has_many :categories, through: :category_tricks
    has_many :comments, dependent: :destroy
    belongs_to :user
end
