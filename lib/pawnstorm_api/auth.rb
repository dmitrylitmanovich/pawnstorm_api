require "bcrypt"
require "jwt"

module PawnstormAPI
  module Auth
    SECRET = ENV.fetch("JWT_SECRET")

    def self.hash_password(password)
      BCrypt::Password.create(password)
    end

    def self.verify_password(hash, password)
      BCrypt::Password.new(hash) == password
    end

    def self.generate_token(user_id)
      JWT.encode({ user_id: user_id }, SECRET, "HS256")
    end

    def self.decode_token(token)
      JWT.decode(token, SECRET, true, algorithm: "HS256")[0]
    rescue JWT::DecodeError
      nil
    end
  end
end
