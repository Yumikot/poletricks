class Trick < ApplicationRecord
    # belongs_to :user
    has_many :user_tricks, dependent: :destroy
   
    
    
end
