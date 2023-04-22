# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord 
    
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: true 

    attr_reader :password 

    before_validation :ensure_session_token 
    #figvapebr 
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username) 
        user&.is_password?(password) ? user : nil 
    end 

    def is_password?(password)
        BCrypt:Password.new(password).is_password?(password_digest) 
    end 
    
    def password=(password) 
        self.password_digest = BCrypt::Password.create(password) 
        @password = password 
    end 


    def reset_session_token
        self.session_token = generate_session_token
        self.save!
        self.session_token 
    end


    private 

    def generate_session_token 
        loop do 
            session_token = SecureRandom::urlsafe_base64(16) 
            return session_token unless User.exists?(session_token: session_token)
        end 
    end 

    def ensure_session_token
        self.session_token ||= generate_session_token 
    end 

end
