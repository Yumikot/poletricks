module UsertricksHelper
    def check_user_trick(trick)
        # return true or false
        master = current_user.user_tricks.pluck(:trick_id).include?(trick.id)
        if master
            "master"
        else
            ""
        end
    end
end
