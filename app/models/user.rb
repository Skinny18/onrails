class User < ApplicationRecord

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :senha, presence: true
end