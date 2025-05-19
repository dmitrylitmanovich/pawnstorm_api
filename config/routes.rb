# frozen_string_literal: true

module PawnstormAPI
  class Routes < Hanami::Routes
    slice :auth, at: "/auth"

    slice :game, at: "/game" do
    end
  end
end
