class Comment < ApplicationRecord
  belongs_to :trick
  belongs_to :user
end
