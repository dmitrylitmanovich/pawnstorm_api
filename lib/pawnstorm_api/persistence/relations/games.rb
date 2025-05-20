module PawnstormAPI
  module Persistence
    module Relations
      class Games < ROM::Relation[:sql]
        schema(:games, infer: true) do
          attribute :id,        Types::Integer
          attribute :white_id,  Types::Integer
          attribute :black_id,  Types::Integer
          attribute :status,    Types::String
          primary_key :id
        end
      end
    end
  end
end
