class User < ApplicationRecord
 has_many :posts
 has_many :user_comments
 has_many :likes	
 before_save {self.email = email.downcase}
 validates :email,
                        presence: true, length: {maximum: 250, allow_blank: false},
                        uniqueness: {case_sensitive: false, allow_blank: true}
 validates :password, presence: true
 validates_uniqueness_of :username, :email
 has_secure_password

 def generate_token
    loop do
      code = SecureRandom.uuid
      break code unless User.where(auth_token: code).exists?
    end
  end

  def set_auth_token
    self.update_attribute(:auth_token, generate_token)
  end
  def email_activate
    self.email_confirmed = true
    self.auth_token = nil
    save!(:validate => false)
  end
end
  