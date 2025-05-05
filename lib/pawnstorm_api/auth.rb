require "bcrypt"
require "jwt"

module PawnstormAPI
  module Auth
    SECRET = ENV.fetch("JWT_SECRET") { "dev-secret" }

    def self.generate_token(user_id)
      payload = { user_id: user_id, exp: Time.now.to_i + 3600 }
      JWT.encode(payload, SECRET, "HS256")
    end

    def self.decode_token(token)
      JWT.decode(token, SECRET, true, algorithm: "HS256").first
    rescue JWT::DecodeError
      nil
    end

    def self.hash_password(password)
      BCrypt::Password.create(password)
    end
    
    def self.valid_password?(password, digest)
      BCrypt::Password.new(digest) == password
    end
  end
end
