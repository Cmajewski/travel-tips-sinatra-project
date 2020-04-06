class Destination < ActiveRecord::Base
    has_many :tips
    has_many :users, through: :tips
end
