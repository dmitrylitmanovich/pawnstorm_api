module PawnstormAPI
  module Repos
    class UserRepo < ROM::Repository::Root[:users]
      commands :create

      def find_by_email(email)
        users.where(email: email).one
      end

      def find(id)
        users.by_pk(id).one
      end
    end
  end
end
