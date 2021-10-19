class User < ActiveRecord::Base
  has_secure_password
   
  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  validates :password, presence: true, :length =>{
    :minimum => 16,
    :too_short => "password is too short, must be at least %{count} characters"
  }  
  
  def self.authenticate_with_credentials (email, password) 
    user = User.find_by('LOWER(email) = ?', email.strip.downcase)

    if user && user.authenticate(password)
      user
    end
    
  end
end
