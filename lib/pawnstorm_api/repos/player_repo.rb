module PawnstormAPI
  module Repositories
    class PlayerRepo < ROM::Repository[:players]
      commands :create

      def all
        players.to_a
      end

      def by_id(id)
        players.by_pk(id).one
      end
    end
  end
end
