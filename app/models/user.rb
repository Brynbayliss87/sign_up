class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: valid_email_regex}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password_digest, presence: true, length: {minimum: 6}
end
