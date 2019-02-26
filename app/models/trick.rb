class Trick < ApplicationRecord
    belongs_to :user
    has_many :user_tricks, dependent: :destroy
    
    def like(user)
        usertricks.create(user_id:user.id)
    end
    def unlike(user)
        usertricks.destroy(user_id:user.id).destroy
    end
end
