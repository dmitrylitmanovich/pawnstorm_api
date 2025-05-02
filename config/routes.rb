# frozen_string_literal: true

module PawnstormAPI
  class Routes < Hanami::Routes
    # Add your routes here. See https://guides.hanamirb.org/routing/overview/ for details.

    slice :auth, at: "/auth" do
    end
  end
end
