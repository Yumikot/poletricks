class Category < ApplicationRecord
    has_many :category_tricks
    has_many :tricks,through: :category_tricks
    
    accepts_nested_attributes_for :category_tricks
end
