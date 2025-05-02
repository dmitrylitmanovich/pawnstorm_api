require_relative "./relations/users"

module Persistence
  def self.config
    config = ROM::Configuration.new(:sql, ENV.fetch("DATABASE_URL", ENV["DATABASE_URL"]))
    config.register_relation(PawnstormAPI::Relations::Users)
    config
  end

  def self.container
    ROM.container(config)
  end
end
