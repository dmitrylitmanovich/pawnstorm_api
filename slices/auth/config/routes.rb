module Auth
  class Routes < Hanami::Routes
    post "/register", to: "register.create"
    post "/login", to: "login.create"
    get "/ping", to: ->(req, res) { res.body = "pong" }
  end
end
