class Like < ApplicationRecord
    belongs_to :user
    belongs_to :trick
    validates :user_id,{presence:true}
    validates :trick_id,{presence:true}
end
