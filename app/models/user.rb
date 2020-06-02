class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 1 }


  # def authenticate_with_credentials(email, password)
  #   emailCleaned = email.strip.downcase
  #   @user = User.find_by_email(emailCleaned)
  #   if @user.authenticate(password)
  #     @user
  #   else
  #     nil
  #   end
  # end

  def self.authenticate_with_credentials(email, password)
    emailCleaned = email.strip.downcase
    @user = User.find_by_email(emailCleaned)
    if @user 
      if @user.authenticate(password)
        @user
      else
        nil
      end
    else 
      nil
    end
    
  end

end
