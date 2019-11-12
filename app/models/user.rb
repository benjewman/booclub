class User < ApplicationRecord
    has_secure_password

    has_many :summaries
    has_many :comments
    has_many :books, through: :summaries

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7 }

end
