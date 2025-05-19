module PawnstormAPI
  module Persistence
    module Relations
      class Players < ROM::Relation[:sql]
        schema(:players, infer: true) do
          attribute :id,        Types::Integer
          attribute :username,  Types::String
          primary_key :id
        end
      end
    end
  end
end
