module Auth
  class Routes < Hanami::Routes
    post "/register", to: "register.create"
    post "/login", to: "login.create"

    scope "/me" do
      use Auth::Middleware::RequireAuth, user_repo: Hanami.app["repos.user_repo"]
      get "/", to: "me.show"
    end
  end
end
