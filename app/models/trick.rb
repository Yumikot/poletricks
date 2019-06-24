class Trick < ApplicationRecord
    validates :title, presence: true,length: {minimum: 3}
    has_many :user_tricks, dependent: :destroy
    has_many :category_tricks, dependent: :destroy
    has_many :categories, through: :category_tricks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    belongs_to :user, optional: true
    
    is_impressionable counter_cache: true, :column_name =>:impressions_count
end
