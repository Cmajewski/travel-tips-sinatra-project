class User < ActiveRecord::Base
    has_secure_password
    has_many :tips
    has_many :destionations, through: :tips

end
