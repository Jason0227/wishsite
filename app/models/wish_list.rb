class WishList < ApplicationRecord
    validates :title, presence: true           #rails 4之後寫法  
    validates :description, presence: true
    #vaildatas_presence_of :title #rails 3 之前
end
