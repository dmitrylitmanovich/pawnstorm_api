module PawnstormAPI
  module Entities
    class Player < Dry::Struct
      attribute :id,        Types::Integer.optional
      attribute :username,  Types::String
    end
  end
end
