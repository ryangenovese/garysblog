class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy #will destroy all articles is user is deleted

  before_save {self.email = email.downcase } #this turns the email to downcase
  validates :username, presence: true, 
              uniqueness: { case_sensitive: false }, 
              length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
              uniqueness: {case_sensitive: false },
              format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
