class User < ApplicationRecord
    has_secure_password

    has_many :summaries, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :books, through: :summaries
    has_many :likes
    
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7 }

end
