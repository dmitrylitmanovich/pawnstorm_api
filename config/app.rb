# frozen_string_literal: true

require "hanami"

require_relative "../app/persistence"

module PawnstormAPI
  class App < Hanami::App
    register "persistence.rom", Persistence.container
    register "repos.user_repo", -> { Repos::UserRepo.new(self["persistence.rom"]) }  end
end
