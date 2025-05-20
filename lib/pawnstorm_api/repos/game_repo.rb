module PawnstormAPI
  module Repositories
    class GameRepo < ROM::Repository[:games]
      commands :create, update: :by_pk

      def all
        games.to_a
      end

      def by_id(id)
        games.by_pk(id).one
      end
    end
  end
end
