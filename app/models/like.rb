class Like < ApplicationRecord
    validates :user_id,{presence:true}
    validates :trick_id,{presence:true}
end
