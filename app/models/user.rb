class User < ActiveRecord::Base
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, uniqueness: true, length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
                       uniqueness: { case_sensitive: false }
  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
