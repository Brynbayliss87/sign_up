class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest: true
end
