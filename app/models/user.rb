class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :cars
  
  validates :email, presence: true, uniqueness: true
    def to_token_payload
        {
            sub: id,
            email: email
        }
    end
end
