module Auth
  class Routes < Hanami::Routes
    post "/register", to: "register.create"
    post "/login", to: "login.create"
  end
end
