module PawnstormAPI
  module Repos
    class UserRepo < ROM::Repository[:users]
      commands :create

      def find_by_email(email)
        users.where(email: email).one
      end
    end
  end
end
