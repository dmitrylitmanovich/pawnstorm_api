# frozen_string_literal: true

module PawnstormAPI
  class Routes < Hanami::Routes
    slice :auth, at: "/auth"
  end
end
