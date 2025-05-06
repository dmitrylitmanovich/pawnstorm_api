# frozen_string_literal: true

require "hanami"
require "rack/cors"

require_relative "../app/persistence"

module PawnstormAPI
  class App < Hanami::App
    register "persistence.rom", Persistence.container
    register "repos.user_repo", -> { Repos::UserRepo.new(self["persistence.rom"]) }

    config.middleware.use :body_parser, :json
    config.middleware.use Rack::Cors do
      allow do
        origins ENV.fetch("UI_URL") # React dev server
        resource "*",
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          expose: ["Authorization"],
          credentials: true
      end
    end
  end
end
