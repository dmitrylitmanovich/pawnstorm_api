module Auth::Middleware
  class RequireAuth
    def initialize(app, user_repo:)
      @app = app
      @user_repo = user_repo
    end

    def call(env)
      req = Rack::Request.new(env)
      auth_header = req.env["HTTP_AUTHORIZATION"]

      if auth_header && auth_header.start_with?("Bearer ")
        token = auth_header.split(" ").last
        payload = PawnstormAPI::Auth.decode_token(token)

        if payload && (user = @user_repo.find(payload["user_id"]))
          env["current_user"] = user
          return @app.call(env)
        end
      end

      [401, { "Content-Type" => "application/json" }, [{ error: "Unauthorized" }.to_json]]
    end
  end
end
