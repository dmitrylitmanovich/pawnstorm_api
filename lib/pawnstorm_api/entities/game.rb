module PawnstormAPI
  module Entities
    class Game < Dry::Struct
      attribute :id,           Types::Integer
      attribute :white_id,     Types::Integer
      attribute :black_id,     Types::Integer
      attribute :state,        Types::String.default('waiting')
    end
  end
end
